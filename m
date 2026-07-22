Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FDF37996C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784684631; cv=none; b=WYQQGeIzlkJ+3uEmBBDMlzHjZBapdGzVlEKwDbc9p9s3UxzBRny5zmzCcH3X8wDBbX36npqOzLnZ4NrClryadZQoS7p+v9A+dfuApV94wnzzJQDQrIRQd/bq545OYEEZGnwwZG9DzOSbRgPEYb9w27N+UKyItXnRCCII1JGkUf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784684631; c=relaxed/simple;
	bh=9npdYYfmmoEFSOdMRuCF9ofpjtgzf0emYQNLDswd7Xs=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=dDFaMmcjjj93bLXFksoxHN4IL2Qwy0IjHuBwSWZ7sRpAbomqJnfbTaelCZwrrEgfm17iuKEArT3qfUwF946Gc1Yf/PhegIsj5NoolsLhFdhb3ItUJZ5IlWvDZpW9qvANPEEbH9JKWXQxVpmabAwTLbu7pe1G0CZnXmyL7GiN+/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LA2tnapK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqdzqWd3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LA2tnapK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqdzqWd3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1Cl6v3537176
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0U3b767XcKM1yI5dNom2b5yXzsy1XqusCrGXw6rAhM=; b=LA2tnapK/pYKtxWP
	x0KoCjHcR720XIxO2Q5RhUsqy09mUEr/sUZuGMr9pQiQRnk/7wedO5cJDv9J4nUS
	UEHhgIaLYpSBIeq9qxQbZDh32pklvVPzDNKeUVaf4KhQQXI73X4L6fpFhsFbfUSZ
	yoiy0b2n9gmxuaG6Rd7pBnVraf7E9nLTsi2S1+pluEZTnePAHD8jFrZEEJifKeKk
	hoJsa2vSQOW8krNh3EjZm1NYawXHVEjuWcS9dFWqWVyjP6tt5ntiFhvc1rrXhFKe
	BhO34vx4ouB6U0W5/ebWZg99vVmNN3FpUQaUx+bYvyrkN6TqedfeULNMlLeEMAw7
	+vpAjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6863ux5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:43:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so5861790a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784684627; x=1785289427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e0U3b767XcKM1yI5dNom2b5yXzsy1XqusCrGXw6rAhM=;
        b=dqdzqWd3wK1NDFy++lbOj0nFtZLdnLpPlcMMgBz6151Eqgx4JpFRWYzIDIZXQmRGdc
         +rBgP+UiERvEw+GmVf4C+JrDRWJ8l+bDnLji5LVPS6aFiwXxiPp92S8nK1Av+E2fz302
         TRyxSgfJKrCFydti6JvgBjbxNSjSuJwG4ereuptnt7FTjIWq5cHqnDhJQRmhtJPSWYLe
         Ts8mAi2lZMzwin4eTiY9Fs4QhHJt58sODsiy0VekIM1GaMS7q83WeoaeT26Oy3PnUaFx
         lFMDP84QFJuLLXsmRZKAdrfqX0gZA+Tkvhcbo0bDdiZxYjm6tXzv/FNIk32+0yln2Uj+
         JWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784684627; x=1785289427;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0U3b767XcKM1yI5dNom2b5yXzsy1XqusCrGXw6rAhM=;
        b=W1bJcdrseVsFM5iHqDgNSp94RlflT0azcQRsBnuTusnrrwNwHR3v7uMIQVf5jT/sO4
         dPlTIohqzMBMkA+Qta+q0wzIr4WtUhNJm1Zptm3yLCQ93iffb5zlFLwSpBMvtghZFm7F
         4WbCjLMMxsaOH+BN6Bb4rFX9owbWF4fIsEMpA7CTblbz6dlZGJ2X5ABpkS/L61vS/Fep
         I4ndWNTCFqWmu3BxTxJyszd/bwaR/xL2eybnKQDSae7xkZAOCG/kb4deNwX8HfixLdlI
         ZlTRkCgrN6VUYzpzCBYjrKXyizc3Jbc2pXTbpX0oYSwXKM2qzgdF262RgP4l5EMztnHc
         aiLA==
X-Forwarded-Encrypted: i=1; AHgh+RoVqHQJagx4zpUWtP1u2PBjIfGbxAm4RzFEXAiCrH54IebwTLBFbqm9usnJCkm6P7jk8Ix49vf9PQk/Xol2@vger.kernel.org
X-Gm-Message-State: AOJu0YzV6fr6D1HtOeM75NDlERQiU02Dew3RHvSMGAxt8kEq/NE5AaAk
	vZcCWGUq7szl4xWApOCfHgmMVbyd30AUPpDXcrUlWbxKbJm+SgoiA2nfLG7ZQCn4mzCcXZTfwyd
	oD3cPdFaG1Ddo72Wyy1nqWfUCtHzMEiWSCHpZL4L6m1InIwN6yrafwp4npPRblKIKyeAg
X-Gm-Gg: AR+sD103hUTdtF3iBeKGQitKIG1PPhufZAajfTKEerfOrwUjc0ZlybR6dFytkzQGH4Q
	awM8vnAKQTBPSIz2x4OihW90h+ZHW4nc0BJxwmzaLhZoyHoqXLoXNcnK1Rlw8frs+hxVUpvQ6yh
	S2FrX4iq0TIuO6SJP/LIM4XRzKufI9jvquQ3Qh+gPUHKoY02P0/6GOE2Ad14pqQ4/7faiExc0tq
	clId5nSVsic2yBmgOwtWY5dV6/u9bH4OdAHqYxu8FoQ6mc5j0gav8wFT6tfsJamGamppI4epHNm
	tSWazrZOkqx4dw6NS5tjtA2U1b/wlPb+pXaevubOSJQwjoPlolL5GS3fzy2qQICQibkWyAw3mOD
	+xO2Wgr2I3tSUXh9dC1gSXhUBdBE=
X-Received: by 2002:a17:90b:2151:b0:38e:4e61:c9e with SMTP id 98e67ed59e1d1-38ea3730563mr1080337a91.21.1784684627377;
        Tue, 21 Jul 2026 18:43:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2151:b0:38e:4e61:c9e with SMTP id 98e67ed59e1d1-38ea3730563mr1080313a91.21.1784684626820;
        Tue, 21 Jul 2026 18:43:46 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea755dcc2sm199136a91.0.2026.07.21.18.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 18:43:46 -0700 (PDT)
Message-ID: <13de2a87-308e-4cdb-995d-b49fb91293ab@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:42:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v15 2/8] media: dt-bindings: Add CAMSS device for
 Kaanapali
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-2-c0b1c1167c5d@oss.qualcomm.com>
 <fe40d9ab-2074-4e6d-8d49-0e076a42e873@linaro.org>
In-Reply-To: <fe40d9ab-2074-4e6d-8d49-0e076a42e873@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAxNCBTYWx0ZWRfX+5GCmbBCQ23L
 wRGiUPym5v4cXX4ytaFXqluT8cuBi03cdoh2IX5tacEj0Q2ZIOPyEXHJrt8dQ+dspFgf3C5Mekp
 ociIqThnS7A+mAg0nJnHPKItfMp7xMw=
X-Proofpoint-ORIG-GUID: BYqMXYNwccxN5Erse-c9Rci3eridS-J5
X-Proofpoint-GUID: BYqMXYNwccxN5Erse-c9Rci3eridS-J5
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a602054 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=3WjcDeQli2E4eB_Ao0wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAxNCBTYWx0ZWRfX10BVEwvEs+Vq
 FGOzPZJjKtjo3hFvQcWKhetdQjAi9kn9FzlB1ltXnnEFe3NJmCU790JNxB1+3R0zsxWB4R1NVY5
 acxMPKOK5edtwCAtenut2bNXbC+lF1iWMTDg3bEKP6djwDN21hSK9o0tAg+JanciFoEAnrLmLO6
 AzL8PsImTySQ7Pyv8x6k8Tp0s8QFGVh4GRmprtpby84Ua1EI3GQbBtyXCcSxMQIDDJY3dJF6Ifg
 3hJ7YAOKjOhkdrPH1NBzySNo/0Th8z/pEUH0UicdQgDoIjLSOoDfZ+nXmTUige81AKRSUMCKpWG
 2VgIoXp6KU6wFonbBS8kgY5Y/s5vg8iB3Rgxloodo3mBV0Z3/NC6EIT2yEuO+HpaGCoIbpsxFVr
 d510V6Y/wFRfRli604LhqYHxQm8QSgH3WXSB8DiYOllGLgtn1LrxcL4jE4X3shigAkqhvLwFIPY
 4XPSWcpS5IGYbbM6z4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220014

On 7/22/26 6:41 AM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 21/07/2026 05:50, Hangxiang Ma wrote:
> > +            csiphy0: phy@9523000 {
> > +                compatible = "qcom,kaanapali-csi2-phy";
> 
> The sub-node should be dropped from the examples.
> 
> ---
> bod
> 

Sure, will fix that in next revision after you post v14 PHY driver. Thanks.

Best regards,
Hangxiang

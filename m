Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89931446050
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627036; cv=none; b=K+iYQxeLX002dxy4r/7PFzaYrLqsb7ZK2iELq79HK5z2fV9Y3VGhdN7bvHJ3JKlok0ybLk8XKFyejLOccpzksZyjwPNz/IuAWK5oTOGrs+Ib0U+eQiSAY9w2DoXziqtiYJCpEO874p9AnIRUL5VRSOCeKjvJQNPnEkjc6/SIV8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627036; c=relaxed/simple;
	bh=sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tu8tFMdWRXuBMwKRISQM+5Qfm4iww+Q8e/r1y09oSrgT2JD0LSqJdX4bzJ5prfhhWK3yTGz4Zr7ixOTUTHGLwcy+EQQyMx/aJn7gyN55kAEczrhAPBW9kZFWR6labGp1ZifwdPI36se9p9gu74JCtjpNXFt7d7Qbp/VdztKxQXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WM2zE8kx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wl+v2Z8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WM2zE8kx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wl+v2Z8L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8fOXE534758
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=; b=WM2zE8kxQRWUGbM6
	b8ChIWo+2PIencV95iUP3LDCZW0ICNsFZJ7ZZIvNecPRy9PdyCOuz36JXnA1D7xy
	7o4vGF4/C6eVcPXyNi3y6oj8aTtcJET5VZ5HPX+jU4CTRR5HrMlWTRPWl6IyCEy7
	7ISYfj6JBYF9s/j8orn8V06nzDldBgtH9W8J+u9Ptu4kuQYni/cV4CMFXPip2G5w
	zUBOqn6YRLfcAZOLz2kalYqklx93aFH1oWKVSxbHTgJVNPkDByOm2ePzv+fMBME4
	AaguVk9mFaLnXS6BtPTBEeLuS0dK4tTUAJOn86UVJXSclB2OhHAb73AWB5KR/8zs
	9LmcvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duhj11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:43:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so224677511cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627034; x=1785231834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=;
        b=Wl+v2Z8LwNe4G+g/+cx19uKuXt4t2Pi9bSTo1RDOqiMjNhTRHlQot6BTUcsadIjZpQ
         bq8MerYjz1fQE9k8ld4OP/Zwi3Y/JfxMN5RSF4b4BJ6u1vbih7shKtAVuo8LbywasoTc
         Mlzml7X3+OLk9js3YHl/YXsrU4QyIlAGS+yL67IjsyANP+xNYTsE81dgui2NlBri6zzc
         LcDYAWbu3IHZALZmpy7kshjIdvszfS6iWA+8MDm7+hv2QLW96zrFa/Q95hTQDBYt+pVW
         fWo//5g2e0V/NMbsh+xxhTAL2qvhj0CHhEBeegWNHEPyQyGAZBt5XQqnDKd2rOdtm71Q
         h/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627034; x=1785231834;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sEdc8ptl0BWyFMn4c2BzaqOSI2kn2PN3cfc6Dvyqwd0=;
        b=ngso7VdNaLwR125JyRXjP4kXNZmQyC/e1YYkuWp7FzP0GAmhSqmqbcm0cCTZnijm0V
         ZEAFZcSehfRKLoHcBpRib2P+aunIbTHI/ToqYBgPpxHnsXscUqRnCa78890J0We96f9k
         jy1O3eS8JSxaM5MgNFPswTiO48dgeIke+EtZthzG4EHGiccvRSNxiyPb0gXZOsUHD5fU
         Rei1qlaIQNus3xlQDz9FQcR+E81YfcAt5KtStlAeyGmomctIjP9HGpmwOiS52zg1Jse4
         ReBZc/izRdT2ozkqe+b7KeFwO3okcLrAa9J/ll9IV52dhetAJ/cpMOaxfgidBQAkvDEv
         jAyg==
X-Forwarded-Encrypted: i=1; AHgh+RpiWO0C8aKhuNzi2yOJsNLVi2xgVt5Y0nMihBAXMyAnBI+EhjUmo/j/o1Ygv8SVd9Aa2Hqkq3Jx3vGBNZL5@vger.kernel.org
X-Gm-Message-State: AOJu0YxsSracdEPWTDoO8Yf6+tN9dfdU8Db12uTps9uz5VcS9fIlfP/M
	Y8daDrf5Pf1H5YICEqRrUq7pdC5tOKPRggOiBSgNqKIrhkQTOcoMQnL+JhyPqFstm+UQ4N/QU5k
	mBIHnsbjisQpCjwHS2YdAqjEctY7kpJkuXBkhXPwFalaQuCuOY83TOiX1F9bX0PCuWdC4
X-Gm-Gg: AfdE7cn1iyY+HGCwqP3kwa+xouAUhCuOJ7+QB0mT3iOCxVjrHMoHPynEMCy4nNLuRs4
	uNaZo7aW3XHRzxZXwqOT8VP5wFZyJMGNK7ufwxhKZdiR/euGZ2hAzYDWi9q9KWXDbyriAWMGhrD
	6ETfpgNjvao1vO+e5oe4AHQowyksEvmsFZRD4KzfNiiGsfRQkii6HZVXWwOsibPCn6nnwblPdio
	n6UXpJGhvNQqs/WwWcOho9ZBU9sVRIZxuty6vkt+dtGwkreGZd2Z7fXOBS0/YxCsldfWTHjZKO0
	TRx1GAvQHF/5Vkz5/l4BsVAhn2Thfm+e1BV/4QyULuiSrbLVsV0EnklPX6ypr7/n2aJJl+m3q9q
	eDiE4jhMDeSmdriMNMvvLT2Mkcbivcw==
X-Received: by 2002:ac8:7f8f:0:b0:51a:8c9b:649c with SMTP id d75a77b69052e-5213d0c5b54mr163989191cf.64.1784627033811;
        Tue, 21 Jul 2026 02:43:53 -0700 (PDT)
X-Received: by 2002:ac8:7f8f:0:b0:51a:8c9b:649c with SMTP id d75a77b69052e-5213d0c5b54mr163989061cf.64.1784627033450;
        Tue, 21 Jul 2026 02:43:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm40615744f8f.21.2026.07.21.02.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:43:52 -0700 (PDT)
Message-ID: <19f5110e-ba27-4599-886d-2eff6d3f8b8c@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 power-domains constraints for Glymur and Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NVrX3HFanQUNQaGPpYIjFhycLf73FqSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX42lqMBqQ7zn6
 dIxLh9tnZNWtpvm3nwpo5VasXdSzV4CSsvez9+oIGvBEQLkUseEAo2TRmGeM1u4bWPdEAuZfLMv
 nzXQ8cMgAT676KDlrzpCBPi0arQA4Mil/TLIDdp2rGFOi+y63Pn7RC273kIpHO38B2NP6T6VXJ4
 nCvInvoSMfOPmZsbiE61ZdRtrTcu3eZYUX6mg1h0DTWXw/MKj4+PKajGuESl7p2T9f7uW5ydJS6
 l/Y7UtuW/gTiCnb8ZEj2utCGr48XWWpzhzIvsgNrUQp2gGTQN59vL9uoirCgdHT18IGJZrJ4KBs
 YaJiwh5C99TOwbamswMrLmcdNFBFe6FKON44ck8OOGn29S8dF7D+HNNq8A0FZjDKeu+ugLEtM9Q
 +tkJrfVArBxH6qsz4gOSWYGBGce0VJ7bWHQEqpsDtFgdhK5AI4CMsKkqBixROX6PdzjHBXnGLkw
 j15/Z9fiBGEy8mrXUMg==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f3f5a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=5Zs7ehh7ZNfAQ31CW3MA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: NVrX3HFanQUNQaGPpYIjFhycLf73FqSB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX3DXfvz2hqoo9
 as50xxUsNO3W2Fp6iZTldxdUUYrddFlhooexKXdSolXSGWs8E6S46Y61SzlcZdxWEGzSfuoRY0o
 3xfnPp5EHmcOUi1e23XI9PJZ59g8Yz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210102

On 21/07/2026 10:47, Krzysztof Kozlowski wrote:
> Add missing constraints in "if:then:" block for power-domains on ADSP
> and CDSP of Glymur and Kaanapali Qualcomm SoCs (rest of flexible blocks
> were constrained already).


As Sashiko points, I missed a piece and this is a redundant change,
please ignore.

Best regards,
Krzysztof

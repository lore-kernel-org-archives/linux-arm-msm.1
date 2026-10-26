Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031537;
	b=IHGUAZnyXUrD/ptnjIqB4ttgxHXdXlvikeINDaicDsaVFWoa0ASVt3uDJDvgX3NXEVz2
	 /7vh45v6GKPQvbLaN9JNRfZPTbLbPuIWET4DB11KVgm5BHjO2xzSiVFCldlTcide4p26R
	 S+TTvcNHTbDxNYgGY7feP1nJ1YjVH68coFNmjq0HYe8ngJeZBmQEI/2auWV1FKkdzC9Tx
	 S/PeOR4/W4m8cqNRRABitULm7SZodSbZyOl954/GTf1zyLFmdBorNCx4ld3BwDX7wBJgu
	 OB7Z8A13Cb4G2RBmXdfbYSUl0pcZulixsn82nH+onKZU1/SVGu9C00I9eKqgRp5AIxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kWKytCBvoLHHoEknZWb/nEOwpJei4el1w1yVW8YR0pk=;
	b=PWjjq0xcu4ZXYWHs+aCwuzGx7PaijhTRw+F5CDFIGc0lm33iZANs/CnCFgS3SEgbkePp
	 jxXCZBdaL6qxNa8ItPW+jFycQSLeN87EA/im4FMjqMzA3/QgrrJX3Ll1JnWrL0RtoHJ/d
	 yHxs9Yo7IoK6ghbYv0WlKgU/8xjGbtJ2xKYOcmO0S23D/e+JJp0KOZAUwiXUlAMMp/FS/
	 tRdeQjqHDJRUeY5x0jBr+NUY2duMIZbbLgCVJNrBGj7NYNQ68D2AGJWYuu5bV/c+Y/ZhE
	 xhUG1BwpZ2+uEOlUCNoHcCC6TzEQXMKyKF/Qa/9ncGmy8Y6xJLtZLmkN1SgW5IaG/1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYwZ4+Ll;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RZ97anAZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3BE606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC3BE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYwZ4+Ll;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RZ97anAZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvsLj3268523
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWKytCBvoLHHoEknZWb/nEOwpJei4el1w1yVW8YR0pk=; b=NYwZ4+Ll9upBJ0J5
	pOM7/5Fc1Rjn+xPMIllxZ+we8haaMYQLij4MLwfxLXy59GyJk/6rxjVIUIt1LypA
	Ez6fljfpBdYzgM8uRyFW1vcBETiqCbbeWNPW/k0wU0/jem0djZbaafGxwVqMJBdq
	3nYLes5a0A2VU/lh+Tab9B57pheNhqz3d6CNU9AIk6Y60FYzO6EB6Z6VogtcSQYR
	rc+seS4IOtBs+hj5//xlOfm8vIWHyPOCkWuTYvhBQ0+y3hfczAvzuDS2i0PFnl2u
	+h2Vd1eb6+gptEy+M/lXfduRX13tbuhLWFh5q8Jy+mQ25QKMxvjdhuOodWMw1BjK
	Fk4YmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp9j9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:18:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so12731585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793031535; x=1793636335; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kWKytCBvoLHHoEknZWb/nEOwpJei4el1w1yVW8YR0pk=;
        b=RZ97anAZdNAOD4vMnVr7OlPqIRlyuP6kazwRVo83xQV+vRq0Dpg8QX3THj+DmbBiR5
         bbwE02ZBBQJeGZ450WSDoANTER4e5Wa0tTbuZxPoxAobEGujByVvXPXLNChCcV2MIT7k
         h3FYZwU7hDybNKu9nQadj2/7k7eoYHKRS+EVtYqO+7VJLZs+zaE5prUwremcK1ytTxUJ
         LvTF8WX8TciuZtdgmqxnl8ndV8mwDqC9uDPWEagnDzbowssbSOg4DQ8Bb/q3nVd2g+KI
         PIE87WSZWlgyF6djV/PMjngrGaLXHPRIBJ9f/CW9iHSeRNHE0OBEwbVfLzxWB4hK9nSU
         NuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031535; x=1793636335;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWKytCBvoLHHoEknZWb/nEOwpJei4el1w1yVW8YR0pk=;
        b=UVeJG0FUDDbl93ynZ1FHoUk7r6UckIXm2jYzsSyqVT9fpzhmTy6sX1aOv+h7/cAKrC
         /Hkv6Rw3GiA7u3Cno5tNpQpEoT85BZbYtIIF+kks/WEoiErwabTeAd9j5yHiHIKjJYH2
         BRUIaxObQMVPTys5S+qwnmWVmZCmS6gorSpedms6JfiFJq2ax5yPt1NBJ8q0yCA0NUxB
         FjPV4YgycATO+TdFIsYS9H+EjmPvRz501GUaSngUfnnCi9LIdxbIRpj75t50ik2YDzGr
         54ZD+Qv/cA3+ay+xAuEO3Vlru06w/3h+NeuUrdC2Ux7sLGjqX01c6xIgHHHy9pS+y3kD
         76hg==
X-Forwarded-Encrypted: i=1; AKwUvBz8YcyyeBUEKmQFRn7aRHzxXoOZsLLb/h5xz+cN/YDT2Vmjb4pd0iR3dmeoQIiRW6TLXlHnzpnAOAzf7aoH@vger.kernel.org
X-Gm-Message-State: AFq9FYLrEFdiYo493fi8PLkCTE9eS93wNOZU0FVp+0+QPq2aquG3fQj3
	1XXEpt/m8mPQ77DXPHyPCveKmRoki3NlwOZV9fPhASiIUf78TD2jVUkgc+O0XdMJUS+0f0gmQTT
	9lxH6WGmcKks+6NA3kP8MlMyQHeK5vVrT3+iulXXxNLDTTnEdCmo32OoB/mt4y7rHDAYiSOrqKd
	rH
X-Gm-Gg: AYBFou0wLJwhCXMpXDt8M29i1iJDuJoKtR8kZ6eRNTMEgqKLTaijKBhBT8tGoniM8Wy
	pnH8FmimT/JeArc8qFlGvpN8ppy2Ccl6QbyzmuR/t1UgY6PXLIivUq3EA6Sk+6ZwfQQlWDCRDOM
	s+i8ir5yz5rwNuK4NLITzVe0AGa4fo7BIqhxGBxbwrFs2Iz68j/6grB2WpgYuv8rh3FdqWMqI6M
	KkoQyFrZ3zXComKY/qoHEIygAq7tYJcea68JISq6Kpej0mAZatSWxuNLpmwJ/Hy9naSdUmCmxdE
	6BYDGxWSIT2a9rReTEbmJQ5UmAW5snS59aeZqBCC1tK3hMAg5lLl4Uk5h53S/feP2OaZf2iSu4H
	tVRXtoKRV5w==
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id af79cd13be357-943f4c06832mr23185585a.36.1793031534923;
        Mon, 26 Oct 2026 09:18:54 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id af79cd13be357-943f4c06832mr23179085a.36.1793031534265;
        Mon, 26 Oct 2026 09:18:54 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm250822065e9.7.2026.10.26.09.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:18:53 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 0/2] arm64: dts: qcom: kodiak: EL2 overlay for
 qcm6490-idp / qcs6490-rb3gen2
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:18:39 +0200
Message-Id: <179303151905.152909.10565381490663805980.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=619;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ENLVtfgMPoAI/GjkuO+vHA/zRez0A6kOQ3KyAIkQzzs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq331rbEbtbZsJsQBWzsA6rWbRBPobaF82jk4dl
 9ZgNjWSPrKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat99awAKCRAbX0TJAJUV
 Vi56EADJJkPJRuCpVdBwNP1MLlZgQjbG2/EZT62ZGEWfM03YCyg54A6a41QVCr3mnMvxgjdrhn6
 bPXk6XXAu1WLFgsYli9bs4UhP+s9hR/Z4Fp9kncgEWGcEsyXmxO64jm+7Ie+gsNW0tOukO3B5d0
 Kjhy9cjyEafbsapFb3j4NxJ4Uq9R78WId6Ytr7wvng8TJu25noCgiF9aIkzW6NTqAhLjg6Q3eaG
 G5S/kiExe3koxYoUQw/H4HLjJEvOtG8pUoEVrl7ot5wb3zBQ2FCbJl7k+BolyZpD2r7munLwC8h
 l6FIVUS1za3SuP48VxZJOUwg3VoztqJgcm8QpZmWfLbmg9yU4oa2pgaJp5x+WmvmT7MlpAKyCzl
 djAbsfeIgzIL7SdFZmfC9nfxIr27jVj6WNGb1Kq7fkyZ/KXH8hD39IiivXgCsd8mRgebdQvRd3Z
 DEQ81NA/Sj/4aHLEAxXvpg5frfOJwwXf+ljABkVeLYhVhKwmmjybgApjsnm2mYjlaHaCkodlGOk
 jnuIhIo9yrw5Y5/NyUnuTSmLfoAIiKV/bqoFgfPx8tTNwCKRAGlX+Eer3O6Zh7bcNr6+2lGGDQc
 n9EdTA82Ub6J2kqRyVaK3aMjFxmIe1Wfv9IddgVgmZi9KOxI3mJZa/QLDPFV3MOelGLaKamFR2g
 bu5FdeyrHFonvNg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfX7t8FytmsZqei
 S7zwvrj48JTc6UuCst6JzxfWVS3sY07lX61eYhIlK0gg07huYNu8NVWFGsWaLIDj8ce3CzQfZGs
 y5ZjcNJoSExRVjYL05T54msBI6/hdjONPHu9vsa2ONRrXAXd3zm6bblc/g9iDJ8CD1QX+TUC8CX
 kuo4XXi2UMju+DBMrFk6OmPlBDhThzw8Nx0xLPPnArkp91xFxITKBlNi5TBW/JYtk5idx9oEPL+
 RbPrqNyyKvmYEDxT3lFooHN8G6V7geTz4PsU5yADQJiP2YP6tBrP5XjtAQr/C/yzEvpf+STm5vo
 M9uL0XdXq0kqyixRc0R2l2iHPI0L+efojo3NzZQhAX6/VjDDIUDPz2tt/bc9viJquRPg/PueRvJ
 sL8eykUnI48VYkusG+v8BMCSg7kfT3IKdj9+i2uUeniOSZHq1cLssyclUSoiKxhVL13fjYwjff4
 DUfkosQqPubDgLBsiow==
X-Proofpoint-GUID: EccjbxQAnE370vHTUPiJjdN5cQmG4VOh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfX47VPEWXavPbK
 5Y775VBouvSjkrWHiyJ7QapZZN3NHWu1em+/mFnAzWzeKXY/ciff+JHShKVF2gtwPUa7q0QNSrl
 O/+sA+rz2uc6bDMkPW/a7caMIM4DQRE=
X-Proofpoint-ORIG-GUID: EccjbxQAnE370vHTUPiJjdN5cQmG4VOh
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf7d6f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nS062M93AAGP_pvMJEEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260064

On Mon, 03 Aug 2026 17:40:40 +0530, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
> 
> All existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
> this series adds the DT overlay that describes the IOMMU streams and
> other kernel-owned resources needed in that mode.
> 
> [...]

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

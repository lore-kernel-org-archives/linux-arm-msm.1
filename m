Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338321;
	b=L/NmTSs+uIQg21nI2pyVyNiQeE9z0bqPtXL6Jw2a5/zLAgqYG3DI8pVcG/djWH542wGj
	 GU0FChLrnMCqgMWFocVxIfRnVeW39L02CTgqcBXsIAsjjlsuMWaem77Y/8lpMshhrw3IQ
	 jlfmQtK+2t727y5SDGqHixXVB1EnafzfagM+HVJfVSGtHZ/Rz5NzTS2ru6bklIT09bvZw
	 QIdig0JzfSE6u0W1+orBgb4R944EK4qCF+9vJAy0g9lZAzeiBc5pitK6dZ1z2dFdUyKIl
	 LSkW4wXA7WZRlaF6ocaR1SdHRs5fTdqIEMRndmTkHzb5o7Dg9K5z4QfEj2HO2bXwBpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=;
	b=BZuLnsxmTbeJsJUEuuNlCPAzAh5LQ3wuN4/fu9WHKNgGabbDRaRivSknI+s1p8uo7rzM
	 I3bDTHbSun2s4xuzAnXdzDmEwDGvN+tYVffb5aS656lh5Bc5HdMhdMCbYKTuvUweK4DPr
	 o9E2WxB8dUWLaqEGSUZV6IJKdH2WBfGNleS+gu14ZNXIsuysHaeNcdxuXY/kbwS4OFN5X
	 4ZRtasQgySMBbQHCk1sSAxakbfXFty+N2sofpVE+gKFa/zRfQfZfNCHc1u3ZpPH9QcEru
	 b2kGV9aB8AwRmisWdQWoYctGSbBEeFBkipDk/vhWpO+M8KxdbuGrzIg6wltnFs3jr7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNnLWepe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FErBUCC3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF38606A33A
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 09:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF38606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNnLWepe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FErBUCC3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM871YH2609795
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 09:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=; b=iNnLWepeZEbGS53P
	Oj5AMw5fDdJf7FdLuZp1XGexYur0dkcBgZKyGnxpw7SfO8vHf0bu/Xrj8v7YB9Fh
	tia6Md+VxBeiR+poVoOlJgX2u8m+aKwb7OdLVW2E5V/rHF1tk52BqgT8DA2N0hk8
	ghocdyMAHVWku5ZuPtGMm6bBfjOSMtFFveXWKTIxFotyy/ZNQrzghCo0N3t9Vcyi
	stZBDAfyRU0zS8FMzyyR6ghwhqWut2d33xdJdCdlS6IzyQPiAn5Fls8obHh/tCPc
	OUKYB+5gEjLzx1NKZgcLMSq5E35zekhEGqJ7IjIU8xksDRKWPmh+vXIWaCIzwVFE
	+QSXMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgb4yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 09:05:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso455628785a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 01:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795338319; x=1795943119; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=;
        b=FErBUCC3gc9bxaCLxgifwmc4ZGnYAsIMvnx6J522JJrG2ABwRgTEKZSBrL2lkUgSb6
         /IUnJhIh9ifipWa9hEkE5xe1kXraXOQ2aaAtABtmc+z4DZsgpTz4baltsBePBqPWMFIc
         lstQ9NIRpUa9vxgmqTtMCMQFis9hsjGrPEP2T61Gb9Oq3ZDC1pyAfc0oW9RsOUPFKgPB
         wVA4zHs7b5B2cJlkwvkh9yCsRXrT0nGjDKPLYZ5KmWEJbzwupztVxQVWbDxFf3I7UtP8
         N1ekfOFrJNRW9Y71IdBhP62IK9C4rzQewofHQBmTD93N1MYqCjjidiQ2ku0MOoSCfdQ9
         H5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338319; x=1795943119;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=;
        b=n4/5yPDlxnjyRaasm6hi9arqVXnauov8UkQVtJpj19GUCvbrRDr3u3SUFB/PVNVdvb
         FuuXGXXYu1nEr6G1NmJse6y5rJb8OTk25IOeagS6HXCbAekANgt4UBT7s2v5fIS820mj
         U+qL7z4XvuJHBFDnNnLJw1CYHAr/Mx11lxteAwCiU2A+Vc2zfiKO3iJaAwzgUiPxI6o9
         EABaVdGVaq7erDAkK55fPnUQrRcbDBL8XRafgBF37IEWhsKdZYTsn0uH5W8K209Ir6fT
         oiiSWPQ5iTf55lzU6B8Tw5LB5VoLpcVgi1mfeuRrrVvTcuID8GdonT8+y+zJFFNfk92c
         uCEw==
X-Forwarded-Encrypted: i=1; AL+hErGJqtWfp3s8f6Wj0KpgLmqN9Q3teF3aCivafnN+R9NChMaQtth5sIpplIrCPmdpWhP4v8NivCgJSpqt0Lej@vger.kernel.org
X-Gm-Message-State: APuU4Z+XNz6ODzMmDkDzzDccHhHVKYAnfJH0b25Rb+qh/YvJA+4z2tQF
	CiPAelB/9TBR+Zi/o/vyyteWMcD2m6yg534M3T8vBHde89uOvkd8EL3VK9I6nRTWbXgdPYCpDfc
	xDJWVQIP5oIF7eVesCP6qt9hqgFRQjqvQiXp41n6futJTYfiyClTqO/ag+bKB0fjUfMx2muwTWa
	+V
X-Gm-Gg: AZFdTZcMSnrZADjU25/hyktYw6eE8E8+Ez1H+Fs9TOHgCkhPpOMh1W5K3LaMXwc1E4/
	uTZh/gZAsR0FLTVBkNltwmSvvVjr+OSDXeRV5efJ5G8c4HCBGmGnnuT730Eq6CcL8TOlJoeV22E
	vMsh+xGyu3pPeZZX06mF+BkSLPScTbEXlB2tgADlghcttHatl1Za24PFW28fey8gyQByI226Xpo
	mE8tn76zl8U+Mc+0hkp1PzkhlcnTMJ8+Gr1ZS66/9LC1RTNv+kNFCnofLgcGc7GoleSL1JmLz6j
	Oc8o+wNx8uLXzWg0HVIIGDnU2QGOdxcoi4Ion1m+pEsc8i1OdlGta823JrKm+ugoiwW/8xBKEp1
	Kf3XJcRKVPPaf1bPH+OSOiWWIBF92dL3jxlyRBFp7XIoo+qK4plD1kZDSeimYNA==
X-Received: by 2002:a05:620a:540c:10b0:949:bd26:9334 with SMTP id af79cd13be357-949bd26944bmr1011097985a.37.1795338318775;
        Sun, 22 Nov 2026 01:05:18 -0800 (PST)
X-Received: by 2002:a05:620a:540c:10b0:949:bd26:9334 with SMTP id af79cd13be357-949bd26944bmr1011095785a.37.1795338318348;
        Sun, 22 Nov 2026 01:05:18 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm16878371f8f.13.2026.11.22.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:05:17 -0800 (PST)
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
Subject: Re: [PATCH RFC] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the HDMI port
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
References: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 09:05:08 +0000
Message-Id: <179533830885.820169.12795261112757355999.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=631;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=7R6ofa5ylz9rX+cxpLl3SXtzYiXYEYo3/l7RH8vz14w=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrArBHh4pKPlzUXOphdGhw3mLyJSktAheSNIVRM
 8QmyaqwAEGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawKwRwAKCRBjTcTwaHBG
 +FrID/99rOh0xy3glImPrS3kTQSdESiR/qRYGaXmUAV59gl3SwhIaGONw79gMgNRq4vj62GtIwX
 Px2Bfp4wuLeuCz2UTz8ljZmuUecVXKbIYKzhgI8tlkebfk7lGy9HzqB10jeoGPJHTUzUfKYR30d
 QS3F9VjQYfwlir8+E6S/x+fk/LL4xv4jKqtZE0UdiWypCVn0rkbQL3LyO3sSk8rvXhy0e++2B/t
 zTmR4I5RJoYCHcXqjmSxPfAzBXVg1ZDZ+ZPr2JSk2cUMHGaFwFhlg2PwvGenkvtqSbF8AgpEMG8
 nERK+W4bg3EBi61CER81NlpB3bs6bH+hPsNqXCEXlkKUfpHnyOeZdaf4O3Owj6fA7lKV5wfpDSl
 pQymJ3omb0149tlM+PpA12MEo1tmxqGb7IXwf471DzxVIwJvjgdVvH+qLEsW/w2RYUcCbvlOP/J
 91zFCvDlej1HAhpvoltHkHxLvo6/86luTI6qQ8biF9jdExmE+paO083U8rno4e6p7HzKTv/lT6F
 SLCoib1qUw+O8cQTiFTocFQzRLSFbKozOG1CM4Yi+E+gJ375Wl1qot6unt++nvN0qyBmM5kGvlH
 glGag3AOphytmE9DZY2uTkgr8qiQr/9mhRayFaP2+1zkUwCIhdvW6SJNQgwhOcyektjvGYbiaVY
 iAUUFOE2vd38EwQ==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAzNSBTYWx0ZWRfX9wwBTr2hyqgN
 vjOoH7yH2Z0X2OPvSNTF8qdLFdXateXhZycUalFRz1kERiq/bR/ia8ToaDFt1aHs5Z2D6ylKZga
 6pdej0FD5vwjeUOfZKxKq1DegjPjYGDw0NMxpKmZvCwA39cwGKt8rEkHtXV4+85LqcOqW6HIKUN
 pC3fRYLt5wz1xUlKwHGaA/8JjXLlTOEWaqPayy5ciComGYbfee1UnHqpUzIWHgEpVWF9zs6AOpE
 4kKvnaEXKOaUCg29u5Ha42GBq4GJTmRw/tAMcEkZbXXdmOxZulGdAMESYjSOKk34q6/lKvT0bnc
 MPF7yKSHVSx0pbtEcIUiqiE1RVFAtnPjNsBvBeHHvf9tgaCs2h/cvpnfKTA9kCMSAdhMn80nmyw
 iyB74FRCHsX+6Z1dbgO1NutLERzKBdRSepvluA0WIewtNzseFcHQY/ndk9RqqHvPFvPY4/NQLMi
 e4EOMjpq5zvj+RgP4Yg==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b02b04f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Lx0Idy8H7x2P_d6LW2cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAzNSBTYWx0ZWRfX388FD8Dc/Qdo
 Cx/L6JHfb12keai8qKENnqLiIDs6LAi1QpIn62iXiM3UzJ52XKuCHfOVR2ILzxWYUqXyHJKOhSU
 hqTxqtHA+BeKZQZMczGE3hufE/8J8Fs=
X-Proofpoint-GUID: Nqf6kSf3DOAbBypRAbkpGisZR-NfxLJC
X-Proofpoint-ORIG-GUID: Nqf6kSf3DOAbBypRAbkpGisZR-NfxLJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220035

On Mon, 09 Nov 2026 11:06:39 +0200, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> The HDMI port is driven by the third DisplayPort controller through the
> DP lanes of the third USB/DP combo PHY and a Realtek RTD2171A DP to HDMI
> bridge, with the HPD signal on GPIO 126. The USB3 lanes of this PHY are
> not connected, the third USB controller only serves the eUSB2 port of
> the fingerprint reader.
> 
> Describe all of this so the HDMI port works.
> 
> [...]

Reviewed-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard


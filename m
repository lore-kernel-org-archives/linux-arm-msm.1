Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264236;
	b=xHWf4b+XSu6WruSpWRcSjmbIcxwhUiPbPlks9FAGM/zUYxGCVy1I4gRbnB7Nn2KKkdhO
	 QBODI3SMbB+NmXYrgDKVgvtyjX17IwXFlHUCRAHONqW07mH1b+wIBXvuekY0scYxwXOwK
	 iHC8zvZ3kMeArbadjdyi4Vx00Sx2I6+Y1JBzZi7dmiD6iYDyyskyr3XSHpRdKhy8FoFQS
	 chsyUJEHnkYlEoGjvpfFCYxgnk9v4KfV+nti8sroY+iaOTNYx8wEmdyxK6ttyAt1zCNnM
	 enF0g1XYcpw6kO7+do99BqSjfmKjVMVNa7AGeis512G1TqeTpCW+gaBxzbfH8+eevQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D4dVdmSFeRE0JHF6scWJ75ZgmMOz+dO8pL/chYBEZxM=;
	b=lmgpLViDLIrZI0j900/ITeI2ODVgcA2/eDKVc86G35qIjsJygiptjDgoeiAE8JdYYa90
	 /rLKagZt8MQe/kxXJDg5RLzzMzmNtWig+OpsBO+Jd51r0fHGDaLGlSrSy5WReTQ5MhOEv
	 rntF+xUtIGNISu25owMMVDx5qjkuPNb5L9mpSBfB3PJGidw6J9/me479R/YVr1mSgzxcg
	 I8CTzzJMCpIsBXnhsGgSdkT+S4MjukgYEpWaImCmKXEOhjkozp+EiEl8JhIEgP9bnPn8x
	 HYp4PaHOASnuoFyJlXkeq04MOZ3GMmtro0aJEdVhvlI4fyvgIF0JkemyWmFArdSCsFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xb8nWuEx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H2a/IXw8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B450B606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B450B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xb8nWuEx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2a/IXw8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vEM03765949
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D4dVdmSFeRE0JHF6scWJ75Zg
	mMOz+dO8pL/chYBEZxM=; b=Xb8nWuExxWSsNj80Iw+7Nh/Boe4LnjrQEuyP3n1I
	ACXVL1hHFjtBaWzhpRF6mdpk8jZN00otuJSZhzYqTzym7bnm/FtJExLruETBp+ZH
	82YhFZaO5355ftSGa7ENqbvZhlRP2C5abtjiGadzH8ofz0TzGzB2qhr4uEuKopoy
	CAPVvZ8L/o0EMa31lWheJd6gtoupEwabFFMnCGxO2hJF/btFpbxkHK3sZtFIcQnm
	JJxYvtaDTrkd/AdJ5Yia6cJKuYxnfjKjHEBEOXWTLcHaAJFrXlc5UHFsuKd6yX5B
	Zb2whAvbiTxt4Jigx5tkIMfFiI/82NzdnkDl577Z60yI5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpts53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:57:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so216777285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264230; x=1793869030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4dVdmSFeRE0JHF6scWJ75ZgmMOz+dO8pL/chYBEZxM=;
        b=H2a/IXw8jtsUIgqoZC1MrJqTqTUsZB1FMUV0dDOex3EXft7ctiBgg58QSg0wi32AlG
         TMvZRk0c7PkMAsoAfR0/DVu//B+YLyqrY1vSi6LlRYM46Rz7xeOjzXWW0hZ/NrYJ5Mlu
         jbC//lLHwUyKL0v49Y03hlTn9i4/0ZQJH9BkeyImYsywOsQOCkXBGOU6cT0BiILX8/6d
         OtEka9ZS68lEUp8XJeCnsLDkcyr4S2d4iNf3deqAFSjK2cudSr10vN+b0hjnspFQAzZt
         tHgRqQH14DsCYqyoRKO/OgNGjdpN5kXHKZhTPR+q6XNM/5FHw2BiYVjmZQhbcOAC05oy
         quhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264230; x=1793869030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4dVdmSFeRE0JHF6scWJ75ZgmMOz+dO8pL/chYBEZxM=;
        b=dmjH5rMQSqr3NESaTxqKrTeWrCgtbHYMgODxMUYDdCRQq1iMuyUbS75J+VzAlSRM2l
         C//A9Q+3RAnwhMxBlNeDk54H+QM4MsDsY2N2k9n8p76EdPm6RY9yrVUEQXbezermQpHD
         A0FGHGjK3zuiW3EmRQHsQc52XNT5jyCX+wxJOq6eqz6Wxqy1s1W0nmH77lxojeabui2t
         ThOXoEa4KzupR4FAnmntlbF6K958Omo58YzfcZ8xFbFP0itK1yylOmPCo+AYKw0njs5x
         3AQCdhc/epGnyjtXcMmfcZSYB5X7hz6/SNhBhwm6wnt6oRWNseFhJInwxDYmJCSsLhmX
         mkSg==
X-Forwarded-Encrypted: i=1; AKwUvBxCBQ1eBYcCiHVq7xJtuAHj2XM2Dd2zQ3GM17J5IzEjeoZ7FhpG5Z9r2f1fL7pYCr72ET9j4ThnpOtUK62p@vger.kernel.org
X-Gm-Message-State: AFq9FYKujP+HmIwc8pGIR62L4LgW5+gUkXAdL42YOArGZSXYKjbpVjoM
	x7+j0dCjfK5WsIc5pBibU+wjXOOfshi+6/uEN/bBL75YMQxhX3E48Sid3RbgjRFwM0662uLUn9j
	lm/o2xwZ0Tx1S7xcTSzk0UK6AW9ZbtU1Qqw3//sKgvcCUYuo0udnuOeLTM8V/nxd0r4cp
X-Gm-Gg: AYBFou33A97Dm12r5pQQVclLKdJq9gT9oSTZJqwwi9sNaSiDJQxPp8DWTCPV7bWLYNa
	PEsT38vhxus+tr2pWiutiVAHxNLf0l/9NF9Thr/DjCIUZQTEZbdtt2fp6ywEb56NZ6fI7LRPIAr
	bx7Kwm8PBKz0Q4rn8liDuEx+1MqEkNxL0IeVM1haSvieKRQbJ7PxZST13LX1QrXyN71TEmVx36p
	5fe2pW+re8GjWzN1RCOHvcNEtWijg9OWJqhiuOLG4trTRkAaM78nKYgSSjdZ0SatIzgD78XGbuO
	IqlhufzUoDKLtwJI89jeCNA1uBgiyjaKxVw0sLxxTQvficwTmUUf0QbiG02azHVJGw3Ej0MvTD3
	Wy1I/NCZJ8+RkdNUl6+cSt096egbiYiq47lRFUF5jVJzP+ND4GRiDpgiN2xyMgB/A
X-Received: by 2002:a05:620a:17a3:b0:93f:34c9:9259 with SMTP id af79cd13be357-94408cde210mr707300885a.50.1793264229701;
        Thu, 29 Oct 2026 01:57:09 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93f:34c9:9259 with SMTP id af79cd13be357-94408cde210mr707299085a.50.1793264229125;
        Thu, 29 Oct 2026 01:57:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm34947181f8f.24.2026.10.29.01.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:57:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:57:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dragon@radxa.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl
 states
Message-ID: <m2sh6dfakwhndlpxsq5kpg5nywk634vicyf3n2c6hcx4az3q7n@27cl3z3whwxb>
References: <20261029-sc8280xp-qup-pinctrl-v3-1-48c4ef292dfc@radxa.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-sc8280xp-qup-pinctrl-v3-1-48c4ef292dfc@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXxv/0jY1bdtZv
 YXR6rfFBgC4weFhadl629Q1Wls+W6B4Ow+pQMskBw9j7zEJmvfp/7Z09aKNk1fYdS+8V0qNBz5e
 Okljjs6Q8AVSrBvAM32RXDxQ/9tI1y8C96efUyzlcT817wiXxEmnDg0PV6EoJ31YY2TzwANmOEv
 gg4bvyr/xOlG4yvIcamA2wVNsc3FAQUGjyjjRgAIjyeN6x7sjSM4DyA4J17rfX/Cs6pOvipGOnR
 RSA5JhzZu6KGvyQ75CGmvN2v6zLsNzq2PUpkIgvEjSN7JGGARiNsJkYQNfVSI8JXykUJZPsI0nN
 ej1/cynRoQXfj6Jg5MycmMDRBjnoKFGb+3pbIDWaZMAsroByc+NYISaYQ+/h+rCDrp2vPQdhtNa
 fErlBlj1gG/4kQPhv4rQPvKGPRLFAVNY0UrpepHOL9EJAqjBUPK1oVzxGlpHYWvm8MIJYUPzNVd
 Sp0A6hOaQEWgsO6ZNzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX68cIzu6kDlnf
 WhuhhCnveVWL96jfvfhmIWTPK4quk5ELiTQiBD6YnSWFBLxo4X39yWP4U8Lgbyn9tSswmzewATV
 wtYlE0ZXVEWG+GuJIxGr2EYzvXPBjd8=
X-Proofpoint-ORIG-GUID: Z0lA9d1W3DhUfcTEw6s6vQb8OpbvFw8S
X-Proofpoint-GUID: Z0lA9d1W3DhUfcTEw6s6vQb8OpbvFw8S
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae30a66 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=__UjJjYY8bcpKF5Zf8YA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 15:52:32, Xilin Wu wrote:
> Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
> I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
> Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
> the non-linear QUP instances, and keep the mux function names aligned with
> the driver-supported qup0..qup23 names.
> 
> Define common four-wire UART electrical defaults in the SoC dtsi: CTS uses
> bus hold, RX uses a pull-up, and RTS/TX use 2 mA drive with no bias. This
> matches the Bluetooth UART configuration used by the existing boards, lets
> them reference the shared QUP state directly, and removes duplicated
> board-local pinctrl definitions.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

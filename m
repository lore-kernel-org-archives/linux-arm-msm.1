Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A794E2F2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646135; cv=none; b=uPLFgoXc5UD7A3Lz9/QbvmhVUfBAYgH09V/E+OSCrBBMSWdkuAy2TO57dQiNJByNeVcez4EpQyAwCdlB/dmY4qt3+6K9t5HOmc9QhhXdsX98W74IOxOb33whTb0ppQRTm7XF0jYsuny6mVVCqw8obAxR3SYnhSN2vY8+DiYHi5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646135; c=relaxed/simple;
	bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXAJpskZJ9n8faw3m6p96yV7cFHOY6Ud3Tmc/fl9NkKqDw6DFAtwmnYqKOvEoMz6UwDuP6z1Sk5rqc/NCR60ypV/c5iSwy9uDaB09s+sg90SoiKygvQkeKc2zFikpA33oswSTjuNHEJl5/ZvR8qVSze0d2Td1s5th17uyKJSVSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fi6JniP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OajS7YH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fi6JniP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OajS7YH0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zpcf2210986
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=; b=Fi6JniP/uKE4fwho
	QcHpVVAyhHCVTq+C5qIaJgogxt+X6qm8mVM7v4ZEe88UQ8fJTmCPhZgcW53uXyIn
	3b58OjVQiVxtFIGgUbuawkh7QW2/doZuJ1n+9CCPIAVgfujxJtPPpDVrNM6oTrSv
	J1D0a0x2JbaKwASqIYRGiyysNslHAmOIEchwB2yIfdyA20oPQ/2dgHlYk/XkbJyS
	yk+dMGSkZ2XxjEoa1mljmaECidn3jcwKFcX2Pni+1FYQhJRRDE2et4xzZygcPFkc
	7DNzFUfwW+PoZ4R1XnV2UrL6X+UKXy5HEf2uSpSzU/N5t0nubeqAEVrDGYsjqp27
	+ZYXzA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m24wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso1089661a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646120; x=1790250920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=OajS7YH0hxDnviZ6ZrNZSBFS5ZGYD924hPa6vz8XoNJzPwH9ZhDeoVwG0hghFzbFiJ
         C2vXbXwW/hXNQ3SMo7H4YBd/EZ0Fd+PmY8z8T+YOsJddqe/hyPxVMS8rnfkUabQ668uH
         jASwjlIhr0m8rfKQCY/yTqXGN/urRms++//1UoFLslN/4ANwMvodXcMZrMbaSmtewGxB
         asy8y1Xykc8plrLwd4/VKka1/GQR2RQ2w73TWCIicYJLSes86kXDWhLw2C/sKJsCLjKm
         tysDxa4lsY/l4spUTNq0L+R2HoCJvD0Fglacmn3ddsfydQBwYadCmK4wOZms5FY40C3F
         CHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646120; x=1790250920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=vhWUj4seSB70DPvHU/s9pK3ZU/8uhl2yRFTl1fnXxFHhTvDtI6EFnoGfZ+F8iHC7C/
         /tovuSvfQEM8uoFl9MJBRT6Tn+NTPXhwcItLNixlE8J6Iab2mR+n0O3ghES10N4IJsju
         YXfSUiHV5swG6wimCjOlEUGzDXYfzjfWqUaJ8mJCCQ7IWRwBKGtN2Tf5dRbCFczdNQfR
         yqhRSkKPMu3Rqku8VWkxUODc6VX53NM269VWzm0IvqV/dv3uV7L609Qq0xNba/kAwJtU
         Ez8JNHo0bYBOIxPKq56NLdrSUKbKR6z0LKedPo5GIPeckvTqX1qcNKooOOvG5+k15WOK
         W/Eg==
X-Forwarded-Encrypted: i=1; AKwUvByqDTgPdl2cSEfRNt/qw5t38TuSanIDM13XSkmXQ8kgJG+L0mROle6wzAFFcYawG6NKEJmosY9QZcoB03Hm@vger.kernel.org
X-Gm-Message-State: AFuF++kpFCAUJ+0Dzg+YrqZvYG+ugXHHtn0wzL4kZSWjnTABLLNXZ0lX
	CdJJ3h4Xyc4jUySv1gwJmNuvSgdRBFMRe7Z4eptEVSkzC+Tm+QptRIJ1nnTDuKksA0RLSCXfz7V
	QiJALPiMpSWTYC+ArsxVHZeKAVhgnNL2/zSKTeO3E8Uo5vJ1IuoqbB2NdZpx7p0FCLa+X
X-Gm-Gg: AYBFou1hNXyQdTtreZoAo7fFMO+pjlnbg6wcxipFALHvCnSkeSg6EHUoQJsEZM7TY0s
	8PKQf95tvZVcvzYF0kI+41mH374vyZ6w9q8XrDyoPDZ8E/VApFpGgdXkNtv1ZYhwafSDD3OGJv2
	Zca0oWeiZL4273r0jNnUkI6rFJ5WtXhzUrJEnea7+O+CwekCLWvHJTnDSJcokymz4vQMrjbVCWH
	Tng3vW2s/dWcAipJVX4n7F+IScx+hqwqBe6CNrpfcKl7hL0KLMZV4wsfHf+AmRHlzRob++SyQCV
	iGChWUBXer03culDxDnU0bvv3LzBLb3jDKa9xI0sBx9n7DBzxCnZeEi8dib+qJNMOz9S0yhAWeY
	hc0tOVJq+0gRCi7pJWysNaaEOxjGCrqfwjg==
X-Received: by 2002:a05:6a21:9103:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3dd5f5e8c0bmr17137920637.19.1789646120305;
        Thu, 17 Sep 2026 04:55:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:9103:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3dd5f5e8c0bmr17137846637.19.1789646119776;
        Thu, 17 Sep 2026 04:55:19 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:19 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:19 +0530
Subject: [PATCH v2 11/18] arm64: dts: qcom: sm8750: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-11-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
 b=OilxmmyIs5BTqVQhAhlpEscfytOalovaVpvmaIvQaNtCr0JkHwTgzOja7V+OHLrEJchM38i4v
 ougO3Q+sa6yAKLviQYX2LTNG71i7QxzO2lzwQ38JAI4rwObd2ER9mVJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabd529 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: efht2oq6DEbLbbW350G2HwEKLbBZz1Nb
X-Proofpoint-ORIG-GUID: efht2oq6DEbLbbW350G2HwEKLbBZz1Nb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXycE2MXgx3REl
 CCiQRbzK1doOvRXBTMiZWRpM/yZJwgmm1OTdvygMLc2993Xgsrc84DbioBFgwncvOu/YnzB9Icd
 CuvRoq+5F+fDIJTywYqBYyR4f9v0obQUycEP3NgqaaaS46JNnOT7X+SdvZyLXSCRcybl44gQ4iq
 pV3DvmV6YyVgtSPdZgIc7j/TV9PnuPDSUxGnvsI168chAOLnxAQeepwdvZ2P/4xpjEgFxaPOT7a
 pDZlGmWvp/ABbxEHZHxXtMXJAxDJVaxFl7qBAlAEWwSWDL6VDwaNRHFmI9Ag1at9vVAiSTua3QF
 +vtwR2gmm6UTd1aphctf3263cwrsVWC8pD3Xr9yskgdxe3AhW7X0Um4qT8vz4Ac+qLx1lkAFzOD
 aM1odymOSopIQ+T1n/E7yoEelj20XCTB+ByAbx/NA9nhejcQngJxr5twagos4XK+4XAtBNm09JI
 MXcCJMxY84SKOZFEbtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX71DkrOsiDLsY
 iOSzJuh0bqnsn126Byeut3WbL6u2nRdkA+QDv5Aj3Q7LJEez6V/fAMigjZzcpWM1+uVKlZMJtfn
 eJ3v1pKYhOFOdhlHr+IG6Ke4lmVCikA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9b5fbc004df4..23476fbd993c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1


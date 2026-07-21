Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FF3BAD91
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622380; cv=none; b=lHII3PGyhp0YDs6GulaLLTY46Y5xJnNDm1C90fS2XRX0sWfoELSTQetZLd9xrb0Z30L2DDDCdsu0XieAp8774f1Wi1w4dHwpNMF8qyT2znXrqGwtthoMfevSbia83QLW3zxSZ9nCEmSgS8GUF9TKSTmdIrNp9485JaVDOkVBAXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622380; c=relaxed/simple;
	bh=/KwvzVGcG3nM+jk2OJ9JEwX3fKFAmDhGAhJvyuTI3h8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImFl3LvhEjSeMU0Esr/7+FlsVCtcvDiQNz20QQlNltTOsLmzkuawqvocu8u2A6jsFCObACSvk9wRhZ7LcYpKrkYGfo1+siZ/To52Tkp1W4/lf08Q5ncevT0p62VPPudiwNZO2ce3QFO61x6RanlT52sYziCwt7HPoCfglnDPv8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOCQDWoh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJaTjvuo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOCQDWoh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJaTjvuo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L3xq4q568625
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ceafmubD3z2hNripLdtNQIg9SXY6J/piHZ+7M7crFE=; b=eOCQDWohh8Mc3bjo
	STTq17E4e+S+vMahxtoZ2fwaD28gs0psPN2IZjtvOUELE3/u98Epo10YpbxtBgzs
	GGBPsNPYyozLeR/LMtxRX7BvKVQWCoNf/OMiTRXyhj3UPUPxt9+dEu2w6dENi0+M
	Kvg/wlTY+p4MIc1fFmf/WRdz5TMqhNUHWjMEpRKyk9NvzZrp4fTD30kNGxEUDrDz
	1arJgUQwfmtTj330uKBIX0KoITociwiZTvjCC6npLboCFXaFXQ0lvSyXCth5dxxz
	JR9mKuFTEVUVAsUMAOwCXwhustKLvid6aGjhCEdUM3mCiRrs6dzoqFGl5SA9bpwt
	3sDm4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvs19x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:26:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so105677841cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622367; x=1785227167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ceafmubD3z2hNripLdtNQIg9SXY6J/piHZ+7M7crFE=;
        b=iJaTjvuoJTo7L4S/1GyrBucMD096znqOmKmzInRG9YH9xAnjgVW0ZltoGDUcnTweLm
         rFbtXIZ04Fitl1pQ+p/OirrDjxtoCGV43h3IpcsUo4QwaCmR9dzMc2xq0joNEFpd23ha
         1crhvTFpqaA4fj5KRhX/pHEfR/oCiREimwrktMpjlboVNxPlW/swjFDAWF7qyc1O3HKP
         TEVhfv94PoImnKSvYyIPnAWz1XpsVft5l97+zOfHQLG617/QL66hDc2b5GkN019zjoVI
         i+FPta7kybzlxScN1f6k6ZU8fAsI40V/8IEmvrBoyB8Sjj97T75ItfgLMIHY4OTRbnOh
         8zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622367; x=1785227167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ceafmubD3z2hNripLdtNQIg9SXY6J/piHZ+7M7crFE=;
        b=jg4uKeS33RW83yWWN9UOkaAViQ1SUeECGgJxqc7Ish4WPAj+JsQytRtt8yEwZQ3Ogb
         A10NxcF4wxd6GxMvClIVcVcclC5s3ZD3aJ/T2z76YLrG33E3orcbTxrBg1Ipb30wZQNw
         mm+V7dQR79cXQqXDz0H+sEwjDKJrf7usO49JEFFzhz/4JbEgLqe9IBY4PgzNQg+BMDnr
         yOgfMlkHWkNL3xXnTRuHBG0K5jebPUx4S4xCR66iBHBUL2f8/svz3oUNTHoooH9eDsKK
         957h18Xqx0RGvHkPkMP6NuFVizZXsOP6d9AgAXoULj8UdBYX5RW3OF4Wbasy2naB9Os4
         bErQ==
X-Gm-Message-State: AOJu0YyuPA1cjhc62F4tA7HEwIHfGlfzNymdc4VcaCoiEhvjxObVSWrx
	nhqwE7+U9KU5Uhhx4RKBZkFFJzzPFEaqbSqFawDqiLowI1zXPTR1zr4/vwjC4a2fO1dPpUKLsIa
	dOtcCFpTU6xfD7Vvx/2ZDpmGFUzJDoIwnmHCDnap+JaxOk/dBRUC25aS6fyiYhq7KeSyG
X-Gm-Gg: AfdE7clgpXK6T9TtdduB7RDemSDE9XdAi4yAIO+rqXpE+HvRnrPg/xxMFBmHPuhmi8g
	jFVUzTKv9U7Qlanm6zG4UHFv1cIIsJScbqEMQBki2fErDmkgYixBwA72+ebYI+PsXHXfK3CdYv2
	lpwyPjGTeBPGTn50s8NbFVMyOcK3oYuq4bm0s7W2DvHmZckwqNGS7Ciwe3RIP3qLngL8xf6EF81
	5RDxlv0BDS8+AFn8D8CUvED7UYZYocKU68yHe6830JZE6Yy65yuHCurHT48EGzFi+iA8s4PtwPE
	WNeqWC/aeUEUeBJLCd2UpqLwLoPd/SNXSLfrWpVNXgUOqw/RrRtzHrSd5goNYddF8MSucqKQGa6
	9DpNkVMkr
X-Received: by 2002:a05:622a:118c:b0:51e:b884:4241 with SMTP id d75a77b69052e-5213c7e568dmr149757081cf.19.1784622366731;
        Tue, 21 Jul 2026 01:26:06 -0700 (PDT)
X-Received: by 2002:a05:622a:118c:b0:51e:b884:4241 with SMTP id d75a77b69052e-5213c7e568dmr149756841cf.19.1784622366129;
        Tue, 21 Jul 2026 01:26:06 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm66664595e9.7.2026.07.21.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:26:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:25:50 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dts-qcom-eliza-add-cdsp-v2-3-e1e52bfb3c12@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=870;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/KwvzVGcG3nM+jk2OJ9JEwX3fKFAmDhGAhJvyuTI3h8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXy0Vds045FGgXsGyL15/7AALBhFE2K0Kf1RvS
 S5xjDw5d/iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8tFQAKCRAbX0TJAJUV
 VvhcEACVzANY/gJKbGcEjnSidaLKO/NzD5GCXL02r1oWAF3lNqDLp25/XpyQbkAbnBlaV4CtM8t
 3+LH0NvN9G/IQyU4oy6Q0jxyPqCRDqofE1LElKyxyWJlbRsUVA5jFeQzEMDucrr8Z9Y+OMt2Cd4
 eK6clfm/ER43a6Dh+hRcdG+IzGXxxCTN8JqYvb7zlKyafdmKB7yZGaAwjBfnRe0BAVks8GzP/6M
 X2qtpsPH4svYTgSrOY7FLM0hZUYn1H7Zgpb14zosAhoGisJ/xxUgbSkIcWQkPlVZTXAF0fEd7YO
 j4jRdso3KGTMYPsErQYIe4so0I42uDX3wLaFk+uOXKIhSzzL7GFXwZXt/NW8vFbjCOU7oIK4jez
 a64x68UJ020Osm1QU7CZ3aljJWfFWrODx0vb4XtwRHqNOXHnDuDQhMhJQwy2W0YYJ66dAwnCBjk
 VbeC06ENKbI6ve6oTdI8VCRJ6YE8XsdC3Q4hBfXhENrt8fp47yuTHbTXiKDPs2aq20USW7j6yit
 EpEVjHBiC/rKk0UT3HiTpB2Dqi9OdhkH8wDmSTymGKrMSivOVSFmvcihXqI7nnec3yZsIfWua5+
 QyAIuh3GKvywD2bAtsKK8v7nkM5RiGe29KjDsC6+1KGwg5fKQZR6fQMyadZTG71cx/5BqoqeOr3
 rLl23LQcRXTKAkA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: PNl4eTwfPl9IaCTc5kwaAtimbizUYOL6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfXyTGdEK26C5uX
 qjA30tHTVnQHh9dXI3S4pZiFS8K40oXcK/k0BE2s8MRWZ5z0RQE7am8asITJykczvWG0EGXJYaE
 ziGXqc+zg55tm50x6kg8oE3UmpfVdYc=
X-Proofpoint-GUID: PNl4eTwfPl9IaCTc5kwaAtimbizUYOL6
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f2d1f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=27Bx3adQT_mWtQqGTPIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX6xI6J6kUQIY4
 tMDXk6FGeJ4Rn6zhqMRIVojSk1QSBn6VM18sPXPaMHTIXZtF8jOYiTZEvQKP7lNkpuC1C93b4k/
 P0Kw4ss/QuvQ7R0lY32sqC1UHj0x5nYsC9bBQgXsilqFdBp2MDKgLZzwrlye4qFSaO6YDoEldd9
 Hm1UU1UtD1hL6ud9Y30sFh1olPUS5RWe2zTNOORfE8O50l/04XhT7nVZVSgEnkY2YK9ZcdiboCQ
 99MHmip8gZ7j2nYbrrXIeGDQcTtS4ZEPKMk40L46aGRUkG4v7iqXgfZDx93mXthL2b7d6M/1XE2
 ant08iNe6vUeDHH2ffRdXzm0v2Oa7bOx97afbgvwC2gIY11gBX7UaitkGsT0bxIRIoE/Zs4+DkA
 S4DOupk7JV3Ebez9dgXag+ervtfr4WaFceFdylsCm+YmFBrsFPRZ4li4dn5LAMB3uDjZKVyBWFy
 Tj+B690kqbTAxgHzNyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210087

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 318ae3c22351..d31267968cad 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -376,6 +376,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85028391832
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091230; cv=none; b=Opt+CvnK+8PmLgqOqQlyQ0ruwtLuImCQkLYSAlgXkgHcX4b49yi7Mdbf40i7VXKFe99Idj5tCb9XHcFLTqqeHMEnQWmT6mqSEmjigierYWJunaQaPYVN2L0+jRGDc2oAgxn351I7XnSadxOu4R83f9RXrmPYAuxeViq8GGqUGjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091230; c=relaxed/simple;
	bh=HnLNXZ3RmH6DPK6kLjbwgAC4lbvAPZcKDrBL0MlxlhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F15kXFt4XUPD1/6OGZ67+55QuuKIwbNwmSOhQwqnXIImwrHjeBo4yAxwQK0ATsjtW9pajJiAUKa4zvh5ZidfehRfMvn6BO06RL0ghk29PFUZ++wmRQdwkOLDyVq3du3iMx9gUBu7WquOaNCgB1oNdI0GHG6dMkz3iOmDYDbGF3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjxkJiZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N87YjIQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjxkJiZy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N87YjIQS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778CIUx3564374
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AHVZhIIlu1sMygyrwMP/LDeKV2f0QMHo2ueK37WbX6k=; b=MjxkJiZyv5H6KsYi
	lY3p29gzWhcaItQERgT7nsRioVJD7JFbiegN7pY+BpwAkVHL8utooaKPhd37vIRE
	wgtRNkcGu8MUsC4BQYjUl++nz5rwRjr1dT5A80shaSnh3l29aoWZ7tQmK78yZCIs
	Zoc+CYCj93rVwPqPaxevHr/83/mj/k8M450DaZxSbbWYwyQO6rgrVINAPH9y5Ter
	5Cpd3MddeyLQIY35amdESF3Zfq3bE/bZghxqtXq8hUByKsXOmoTsC9dbO7Tz1TCI
	E0mxCECskfh7wjz48kXLyZDEHSpuQ/9P69jDUBOe2U6RNbg3EeL/XzjNY89UQUde
	UAa/og==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jtwk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:27:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso4320379a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091228; x=1786696028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHVZhIIlu1sMygyrwMP/LDeKV2f0QMHo2ueK37WbX6k=;
        b=N87YjIQS0lAamLzEeJ2ppaD4IBq+z5Ey/oe8bfVJ+ILfzQbgznosjecP5SNU7MvTlA
         yYgSYdJb1Tf8mtOCiGe7rxEXZk/N+OmJYFPiiWhG3csyGOa/qQUcj+6UCM9Fm7BgTahd
         LcrE171GclO7FCRkTy4KLBr84NXQ3rH+PwQEMdYTT+85JyKinjy8oAsZcYubtI1GXsVo
         XyeYYB1A0wMn+VNTq34rT/VC+UDIO8DW6eXACahLOrWUlsMpig03uJogbAt/r7BSQXPW
         y0pm59GAMEyTf/dZ+exW31kC5i28EGlCdEHt7e1Vh3mdQ/v9VDXCouOqqN7b2FDDFemc
         CfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091228; x=1786696028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHVZhIIlu1sMygyrwMP/LDeKV2f0QMHo2ueK37WbX6k=;
        b=Xb8lBtHdx4R+rqxuR+kzbe7xLaJ1rZm9JeeVHtgIZDwqO0YOE02Ns6kCKjN56i9lt4
         j7F5ENDoZEpTkigVrysdT3pYx7c55k+5Sw1x3v3rEXaXdcllDy2nPRBFYB0lECJEtrfW
         xVWWUDeqDgD/mmccMkBGbb0SGBsrePT54smTZNFFSCwMhcVPDwikTc7ProRtJ0HsMmOJ
         LFOC40J4Lfjjr2yoYfh6a8T8qohHVDYK4Jt9FBX+1xCLejdn272U4UpjzteFMaC6GvBQ
         cPV6l5YeR7cQw4T+M0M+JPcyDvBFjChsT7AOUtKpEq/2zdowkUJKveNzRakrMVAMysZR
         3qCg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2CUj8TpuIrzBpQP97Xt16cXw6ukMFCWTbXBfs2EzHVfSqHNdZ2sCl9Y//fSPgso4V+bG8akMWT47mAZqJ@vger.kernel.org
X-Gm-Message-State: AOJu0YykHfqwXScw4zUT3QERjtwkuOIqbJJKEpEuGLmBb2pozwYUwvSn
	9EcM9elFyPdg3I/F2Wrn1kWR5/cTXKn16k6H+b4GTeZN1X07COLDF77BTANxXOYiTYuXY/xK+4X
	odfRSuepU22D1XSGU7dZYiWFx5jfM3Iac7Il5rbfzBSVAcwkU+3fQyV3HRiLBsvUMLxXX
X-Gm-Gg: AR+sD10q2bM9KHAalmSTd3M1zU+lTmNI+iHsPyX5rt3VUfP4WadslvydHRd22mLAlUs
	hamIPie7Jq6XTZRMUdsS24LOQQAFIbjGJFlgPMM4JuZm4biolpuCST+rSuTP0KGWyr9mI2vTZ+B
	xDONxP9uEi2L6m7UmasQNBPdm0Jgr2lOXIBZYr7VCE/KZeRQEOttnXnlC9YoZhyo5Aj1mGorZyw
	ihbM06/7xbfl9hr0TE/PlMHTWs2NF6lNlSNaUFjpKDO+eJpubRMJvtqwkYUrd90M35yWPap109d
	UgLS4+I90smc94NQ2vw7Hxw9ko9yl9ChiI63tVcHonps31pW51a7o70VuSynfv5aap57Agbs+hd
	k9/RGeatI1tPybHWdYc11Si1omWxWEXoRuQI=
X-Received: by 2002:a05:6a20:244d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3cb85de8c46mr23889725637.13.1786091228055;
        Fri, 07 Aug 2026 01:27:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3cb85de8c46mr23889659637.13.1786091227649;
        Fri, 07 Aug 2026 01:27:07 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:27:07 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:52 +0530
Subject: [PATCH 08/22] arm64: dts: qcom: sm8350: Reserve low IOVA range for
 Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-8-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1902;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=HnLNXZ3RmH6DPK6kLjbwgAC4lbvAPZcKDrBL0MlxlhU=;
 b=nii8Ur16o/TRrI8KA5UBdMSfzt5dFWlLfYGhYvMMqw3h5pdaI2NMuTIzDYhUu+KTvWdFC4XFG
 yuISWtMIpKeDRDFVTd7/a8wrk66NRuHhAa1uad2wy4AqrwMhkuNAav/
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a7596dc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX5yGCEmMHjWa0
 j3Kx9ltqqUxcAhab58ibAiTAhmN2MoAtezII/dyFqNtYPiMEo2FoWGgYFlebjF533b3O9AeQM87
 tnTDqYr31ctB5PtYqNZYHdJ1sSlvU6hi9MwFk9TX7ywC1o7GXZGhN9M45e+jAAcsvRe+6TGPRrj
 //rYNWe64Hvy7ZEE3gSk16oK/pD250bFck8Gv7kz67PtS2EEDIfNR/rporackBFB+KJ8CFAXewm
 mzGhHaSnL79I3dEqt+ESELKKXzbRvkAc7ENrHdICEUOkOkOpI5oOYqKpJ08ziRNqkn1138G6gnp
 u6/0rdN8LnPmeH1R/Y1MVWYPqYEdZALKeW3hN/gV0AOERs1/YZKiSjbYBLwvQjxxjxplzzpnsvY
 7lj+3L4b7PSvark4o3W6i2/dmKZFcZqnQQz7yaOgHbUrDUmgTEKJMjQUy0LuVM6416GhzfduPKx
 6YYZ7p/PbmeyI7zacRw==
X-Proofpoint-GUID: 7Jtbzkdv1b_NeNBDQGkoo7GUUt8tfH0k
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX1ejN6TfzWkEe
 VRT9b9g/5HbdQvgNdlAcXSwHVHlafT1PEZjLvy+P7i6KR3mPU2j+4ORXdDB/J2E+nW0PGzlkwtw
 UUQKmvXTmy982KryqHMhBsd+mFeIVyo=
X-Proofpoint-ORIG-GUID: 7Jtbzkdv1b_NeNBDQGkoo7GUUt8tfH0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070062

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: a2b0c5eba743 ("arm64: dts: qcom: sm8350: add Iris device")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6755dfe9eb92df9c03e5fc2c992bb..b376dda0ed5208633660cc3b975cee738134b758 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -553,6 +553,17 @@ removed_mem: memory@d8800000 {
 			reg = <0x0 0xd8800000 0x0 0x6800000>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2786,7 +2797,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 
 			operating-points-v2 = <&iris_opp_table>;
 			iommus = <&apps_smmu 0x2100 0x400>;
-			memory-region = <&pil_video_mem>;
+			memory-region = <&pil_video_mem>, <&iris_iova>;
 
 			status = "disabled";
 

-- 
2.34.1


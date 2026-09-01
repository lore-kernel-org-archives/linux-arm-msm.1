Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812D429CE8
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 15:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276206; cv=none; b=JP2IsIUBfBhCQpPHMzVNdbTu38YxBAZWvvBvYPy7clwglEoIAE+r/rNz9rTkhJiP0YhYANaHH4R7Bhz2xFNRnDMZY6TaDN5Dutm9DJRFbp5qJYtIA5ImlekmxA2dENR80BWOgpW4wsxFP+FADuTu2xJVGA5vc/ZxtZX8IZGtjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276206; c=relaxed/simple;
	bh=T4zyejV5117qdy9dqEq+zOPv+7e+CzTvpZD8haDST3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VZXK1/+UMRUxeBb3XFvybmWWIcWWMluGfghjYalY5h4ZOkmIht/JaZpMMX+n/gEoptOHnFWjaHBf+1hC3NvJAAZBCGK3b+hPVFsgNtQSfxNax3eZAOOniJS+aWlbR5k/mITMM/Y6dLl6GaKi52cL8Y0teSwkdm2fl7buKl9kp50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BG4MTk15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bkd7ekHV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BG4MTk15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bkd7ekHV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9Qn91638674
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 15:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CvsCp8vxzXRT+34RQWYirv
	xRtl7bpIDhNcvHwwgurxE=; b=BG4MTk151wgfk7DDVmZ1Eb0UP37VMFsyt52gbE
	ruxlSq9/CuCOKHqFnkix4vua4WZs1LUS62oDMJyywJXDf3H+W4lCQswYLe5Sal3z
	KaZHD9XJoUX4SK/DjKtIqahWguy7mak6PinfuSn1HWadm1LCWuEt0lELVVBxPdS4
	0UT8Z1m/zU1JLQE32NqjtNEsUXzony5L6j6FB6y2/azepg1oNx5X3fNLVMePMcc+
	Ea/8Kng4aRc/8CVUXOiP/fVoSoYca0/HZe3MUksrAlG0Q9a7BWHfELe6i2GV8UWp
	GpwVT40fjD5iQX6W3FcMFRyhG83wsSR8WQu1cnGkadzbuL5A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjm56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 15:23:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97bf875d5f8so790137241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276204; x=1788881004; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CvsCp8vxzXRT+34RQWYirvxRtl7bpIDhNcvHwwgurxE=;
        b=Bkd7ekHV9CwFmmBPKmT27Is9gKI0PoZ+dgBzctxg6HzLWHfU1VyXjlcITf46/EAO40
         Qcc58kChyKW/Qqlr5ZpaXe+YcMk983erAyEvzuaAVzwIM9S2VTa5bs8oHRy7JQKZZNGJ
         nBy7XJoXdNSKy6fxaBKY1X0FoFoViUdW/tCkdWu8w9AK+fez2Xg/ht2Pd0I7SLXhjGzv
         QGbqjXkWq0OwYUGgRTC3s5UNCpQy3968xBhf3JvvGfj9REzxmghI/rjgiHM6tsGFQCQX
         eVKkakS8DU28MnYg0KbTerbYiTrHDmZEalziRObrC4ZT46TjyZdN5BCSspaNOmLxPi8d
         MYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276204; x=1788881004;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CvsCp8vxzXRT+34RQWYirvxRtl7bpIDhNcvHwwgurxE=;
        b=SyP4uyCz9nxs71bktwC4CzhDRi+jl1AZr3vhe2k7ULyPbvDAtqNPc37Jf9ErtqbVvk
         bvNlK1DnRm/CyxjWiuvGYFe8POQD2Ol6aabYAy2x20OmysXpDeDFIBkGb3AjcGNu1Uit
         9LJLRPAYvNrDBgg3aUYG0cpQx8CvfNcXnLLwDCgz8SrbdG81UPb+olPyNNFMCJR1rfx1
         RAvrgnnUinFIOq6uhI7usheiURmLLjm0G+lO5zAWj1RVtlrD8HZ/suC1N5nCtruM1jL7
         o9sxONEDZ5VWrwTlXwseEZYAoYRTFgyOaWFK3xDo8uA00yuT8dwt1K4fWCam1/OGFAwV
         Yvog==
X-Gm-Message-State: AFuF++nzTgizAVSIMCjyfIAaNyL7YfvAxTMmvtm2rndA6D75xKAP1GUq
	EzT8LRUrsOps7hKUuba6IY7eaTxJeVeDkLYdVC7UekGrBMJRPDqw4wU9UrE5/5JV6gxaxvVLzjd
	rSHe5Kv0mLmIqGjnsSivTMZQTolKTSfQMpfIkdJxSL8LTgHuClYQFOQ5/SnPdkcgVUm7a
X-Gm-Gg: AR+sD11c1FeZrMCj/KWWv95V3v/npW58y7xHtobUj51OJ0hJaYx5b+YKaABAbWMpEuq
	tSwvaNE/XhonIyLCkROhnfbaSFcPjS42X38NE5dyCc4LImCjslSsPjH2t4zZZE+CeP2y2y+u4Pl
	0CKT0c9lDm/LbDo9Kq6fK5uRRM7WeJh0d7S6SODM5oN5hlpn0gvH1xWrdosY4DSjroXhbLXE/55
	/xSEOQqE2IAIHU2LIGBXLbCqrQoyM5ww1uFrPjN82qrsSfU9vod1H43RBXEAb5JzeB924X8o9Bl
	dlkn1skXCwq8YveknxlAkFaYLhaUaAeVQTXM39l/hbn0Kp9+MTTNVX51HGCAFh87zNZdLN5XTBf
	HcHW07ryYfxai+7FYx/aLjm1SQIaF4NikvtG/oERqxGTWquyBPz/gmuBzbNDYDiRZUxRIVzmmOp
	KEx5xxU3gykl64UtDePMhWmntVDKu41ORFe+F1oGYBk6n0WDgiPvE=
X-Received: by 2002:a05:6102:44e:b0:738:f27:43fc with SMTP id ada2fe7eead31-78a027fb048mr1454505137.2.1788276203526;
        Tue, 01 Sep 2026 08:23:23 -0700 (PDT)
X-Received: by 2002:a05:6102:44e:b0:738:f27:43fc with SMTP id ada2fe7eead31-78a027fb048mr1454492137.2.1788276203066;
        Tue, 01 Sep 2026 08:23:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:75b2:b8ff:76bc:21b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce089c2sm74403535e9.2.2026.09.01.08.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:23:22 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 17:23:18 +0200
Subject: [PATCH] remoteproc: qcom_common: load pd_mapper before booting the
 DSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fix-ath10k-remoteproc-crash-v1-1-c615a1ccb67c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOXtlmoC/x3MQQqDMBBG4avIrDswGaygVyldhPi3GYpGJlIK4
 t0bXH7weAdVuKHS1B3k+Fq1sjaEW0cpx/UNtrmZVHSQUQK/7Mdxz0E+7FjKjs1L4uSxZu5VAO3
 vA0aldtgcLb/uj+d5/gFB4xZjbQAAAA==
X-Change-ID: 20260901-fix-ath10k-remoteproc-crash-420ee2456e92
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Chris Lew <quic_clew@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX97hYGJmchz1f
 +bqKMQd8miCGfVv85mmgeomIdQEm2qVcckRur7WWjX6iX7lehNthTSoerjIGSf+1ipYVMp8CnQO
 nR2P+Wg2eokGpXETd2vrduotY0/Zoi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX2rXGLcIubIcU
 UMzrao85uIdmTa41cFOxJa7njoPPkU3emBzuCmQfnbf+IEevN8LiWKzSMOYZPeoEIyvYut/c9Sb
 SBzT40xnvPZv7UD6Kh+MdlnP7c0y+mGSc87BJnW+2kMYb7ERhN7Qbx66q3+kV4AJFcQslQg7v1o
 59xMcO6YuyLiKTD31Qdft1Zd6tGXl/eALjp6hIeg6FxLyK57PHk1SKxYPy+tWQV3gHbsf4rWEnV
 KSABohysvAGQXSCdrnSpfFb00W9uy3WaWbQ8S9zmxpNF2r516BvnLHMpWkYmYmkpUXkgqZX+3zX
 0LYM+CGOBESDaa+h8xr6xbX4AIdIL6BP8x833vsYgA7JrgcEVm6l4tjTkHdrTWZk3dWV/LEzl09
 DPv/JWyxTRWREG8F+sci9x2re6mBtjGzyNXQ87kbl3M5+ZZFwqv80snC70CLQM3+u5tX3naB/xg
 v2urhxL1e+47ZtlzPYw==
X-Proofpoint-GUID: 9PA1myvw2TRQxpnLbBjfvq5mfr5PC6Jn
X-Proofpoint-ORIG-GUID: 9PA1myvw2TRQxpnLbBjfvq5mfr5PC6Jn
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96edec cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QPX1PbDhblCrr_0_TUoA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010136

The pd-mapper auxiliary device is created by the Qualcomm remoteproc
framework, but the qcom_pd_mapper module that binds to it may be loaded
later (asynchronously).

As a result, the remote processor can be brought up before the PD Mapper
service becomes available. When this happens, firmware running on the
remote processor may attempt to access the PD Mapper service before it is
ready, leading to failures such as firmware crashes or watchdog timeouts.

Declare qcom_pd_mapper as a pre-soft dependency of qcom_common so that
the PD Mapper module is loaded before the remoteproc DSP is brought up.
This gives qcom_pd_mapper an opportunity to bind to the pd-mapper
auxiliary device and make the PD Mapper service available before the
remote processor starts accessing it.

The soft dependency only enforces module load ordering and does not
create a hard dependency. If qcom_pd_mapper is unavailable, modprobe
will still load qcom_common. Likewise, it does not guarantee that
qcom_pd_mapper has completed probing before the remote processor boots,
but in practice it eliminates the observed boot-time race by ensuring
the mapper is loaded first.

Without this ordering, WiFi and modem watchdog timeouts are observed
during cold boot on Agatti and Arduino UNO Q platforms.

[   19.955751] remoteproc remoteproc0: powering up modem
[   20.069985] remoteproc remoteproc0: Booting fw image qcom/qcm2290/modem.mbn, size 8881672
[   20.310311] remoteproc remoteproc0: remote processor modem is now up
[   60.320801] qcom_q6v5_pas 6080000.remoteproc: fatal error received: dog_hal_common.c:173:DOG detects stalled initialization, triage with IMAGE OWNER
[   60.320868] remoteproc remoteproc0: crash detected in modem: type fatal error
[   60.320881] remoteproc remoteproc0: handling crash #1 in modem

The modem eventually recovers after the crash, but this delays the
availability of the WiFi feature.

Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 5294e327f1587efc917eb01dde59bd1e723c225e..0dfe9f16eed328807f178e0399b11f2c819bb270 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -627,3 +627,6 @@ EXPORT_SYMBOL_GPL(qcom_remove_pdm_subdev);
 
 MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
 MODULE_LICENSE("GPL v2");
+
+/* Ensure the PD mapper is loaded before remote processor bring-up */
+MODULE_SOFTDEP("pre: qcom_pd_mapper");

---
base-commit: 786262be6048deab760f68c8acc2c85607165894
change-id: 20260901-fix-ath10k-remoteproc-crash-420ee2456e92

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2924390603
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570932; cv=none; b=PQ6/x10krKlKT1LvfvGgG3MFls4U7ymY7sSXZNo7J+5q80NVUeReb50DVm3RVRechd/20MBIV1LJMOf9Zc7qB+vqGh+qvDov7o71/BraANObF89DRQezDUVS5kIjSoHG4+S7u1X/C9oMyYTiqA0mzVYR1F7FaQUH4CP3Ifx0gaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570932; c=relaxed/simple;
	bh=IbcoGzqn73EF/bO8GfdSrufbJAGc5IIrFGhyjXEiifk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEDVdKy2GuRqEM1uSXlYk2nNCly6dplDUPGA2XSEiR12Lg0lfHvTOShHhGRqy4r+T8KbFfThodEAFvrEO2IeIxUA4U6h8yAj9mPaMNt7JJhAVR5fTluUJ6QZczGw4vjG7zE1hp0JGHrayMFAOkTpXOAF40/Ty3g735wblvhx710=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUUmRSM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4vOAuA3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUUmRSM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4vOAuA3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBN5fM2373579
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4joxmXfur7eXOiFFe3oqnFTTbEYcCWRQbkIKaQk2W4=; b=YUUmRSM3CJDubSmL
	OtcYcHNkHDipg3dVuaMDEehgY+hHE64+B9o82A1Ixo06Fc/kQQfRLkg1Jw6hX17s
	xm0SlJudYbEb1KNd0nMkMOO3/S7HHj+jN2H6RjYGIH9oOA81dHLP1iwqTAzPtuGq
	yEW9F/wlV1gOgkwjcmBjU5n7Ch5Ss5tuqmRQRlAE/X2YP5HEitRothDJVJZd0FvD
	Y9YmMPcoT9EIPyqSmfd6EcXKEUV4eRtrV9EvvIPBCcE+u9xNY7IUYrzl4rKHcJ0A
	pSFyB6NhMPFcspzfJUIGJONShsMNIiJpPfzPKNq5D0j8eu+4Lwj+8iqhiqJoU8bM
	tsz/jg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshbkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so5289052a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787570929; x=1788175729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4joxmXfur7eXOiFFe3oqnFTTbEYcCWRQbkIKaQk2W4=;
        b=Y4vOAuA3fNoJPIwo01k26EGwmG7lNcUPlDrszPNWXM8SVEGL5O8gMif3zx3aJJvNdR
         r1RjCfERZ9oEpAr4XEFcf5HClwqgiVTghWkb7PiZivteTHIiNMZMlGamdYRrxuJeaAYl
         EoULZ9WmlHGWy8bKVUy4UH5gdtDvRhIkKdMkf2IYTzdxlmjJEbpEX6hC/y61Kb/MGrTe
         6DBF5TZ2UynZwtrzAyK1GatGjC3cGuAT973JG9BbQUqeD/skFc3wY12k2XX/CZk+MIFy
         KsoXopk5dyNDshQE1gt6Hwgdlw3u7vKKHhWbfPVtcWgLQeMOCoWW2ZUYcbrGsI9xM2HE
         G2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787570929; x=1788175729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4joxmXfur7eXOiFFe3oqnFTTbEYcCWRQbkIKaQk2W4=;
        b=GxuPJ1IrIDb+UJPDZDV7laL78yyWdBlPIXkkLw8/hnCyEVGSLuOOPh9R252+XWiVmP
         lLYp3+0vRkPtdtIJ+kOYuFhxcGKZ25NxsU0UJcxYAvkImfcEuQzwfNxD1lzZ3DyYrrwN
         PcTYDE6hGsARCGCRN+iq7fINEBFvqCbEJrUyRv0c6sz1UpJKqEMKSWqJvUFUU4tHj1SA
         SUmme6SzQyhxhZQxtVbdquAuMe2D2faAlw/j5sz6AQe7zDsTAE7tU/Oj7gOIpUTgihzn
         eILpWNTXboCS5nFZdT9nc7TLjJzfP8DH0rGlJVlcz37lV5WJsrJIy//F+/E+RFwmnmyJ
         gt+w==
X-Gm-Message-State: AFuF++noD2i8OxdvN0UlHxt0A/70Kv/+cEgFjdwAwcWJWZterSj3ScDU
	8blXcAg7I8jxoXwuxvaauomSZy7IDSF2OZlE2+BoLfMUPuKoPDwYl/FHG4G/2gN1+S10TJ+u467
	wKZXpv8d2ef2tfpgn02AoJVNwC37cjPRf1gMlC2lVlcLUJitctmFPEC4NrDELk1NReOjY
X-Gm-Gg: AR+sD11REM2HEnScEQctKDGxieJ1pI3F0lZkHMapii3peKl0rVqdtonTvClVNnmKuf3
	GJirjDtOhHMCtDPm5quoqC06GgThibddwnCkdYauF0F+9/UGy4TlgvE/IXb1YOB/wOTTMGWo8s5
	Msq2cMEOWaKHy/BenbsUZ/whMSlaYP3CD/VqxBruNO1myoeHznGeLhximueChFX8zN1EgGl3TUO
	rvTFkHqcERbzpsYFK9c6PYJEytDnvq8iyl4zPpdWABat4p74rZvNflOi8jQqTvG7T1aHCSQ0V8d
	GRGULF3ozngIEh6dkxk4+exufj72wPDxWHlWPK+bhWDZogmJV2SBeaarKWzx7ybOKgnncCUoURC
	Vtd8awavZQ33eRcuq
X-Received: by 2002:a17:90b:3d8a:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-395c33daf0fmr49022320a91.3.1787570928741;
        Mon, 24 Aug 2026 04:28:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8a:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-395c33daf0fmr49022262a91.3.1787570928363;
        Mon, 24 Aug 2026 04:28:48 -0700 (PDT)
Received: from [10.213.109.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af750esm9825643a91.11.2026.08.24.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:28:47 -0700 (PDT)
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:58:06 +0530
Subject: [PATCH 3/4] drm/msm/dp: skip LTTPR init when no LTTPRs are present
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-dp-typec-reconnect-fixes-v1-3-2825e5bf8a96@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787570901; l=1187;
 i=saurabh.anand@oss.qualcomm.com; s=20260824; h=from:subject:message-id;
 bh=IbcoGzqn73EF/bO8GfdSrufbJAGc5IIrFGhyjXEiifk=;
 b=4Hj0CTrR6JsyaJTEBY/gXkQi3xfkAI2GTUD0DlJ+E7juBslV44zaJGm+H2nQxgdmzkFSp/rVI
 Iqbl/NaJexwBTQS0lsnfQTAnRMS/qgOSiunA+H5lWE4hyqry+bFIz2G
X-Developer-Key: i=saurabh.anand@oss.qualcomm.com; a=ed25519;
 pk=AzGwbGUPO11yi5XTeGyJKOJWLfzXp5Dru4z+PCg/uXs=
X-Proofpoint-GUID: 6W3I93QlB6VxCK2Nolugt6Nnj8apMnLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX0H7wnDK5kIqb
 +CAfShk5TX0Lu8wWgQC0QwKxOt5i+G+7rWOAbu0C8wbzi3LgiDiVNLKRDOUdvI1wHe+xju8I1Ei
 Ccoj8asS6kpH3xzLl8RqEvrYYnUMy+FWTok9xpk8LCQvvk6g1FHcVJdiuc0jd2nEWFuozUAj9Ak
 B1ExiDVBdcp8ySMIT+X7eQwebmamCu8cm3R7GUvbNUpR3/NRJme6vU+PmoWN+OiwPuH5izLlAcB
 43z6hi50nDdOhUGsN1STz9kPHKMoZd8TwAGtYDMUj7Jbd7z3UHoC284rMDUISFzf2BZJzZPuAuB
 IjVL3xwmSzchP4v2Ulfyyd6aF/+eCA9SoBV25VQfwN/CjfeQUH4jF9jc6m/D0LQpmu5aAFXOIfY
 XntXnJyKBYDwkVwmDSkc8O6XDofE+XyhiCfMJY2tq6V3PdsjOHklA8G1vteOtxHlb2yIB9fMpvI
 6KCZ7HLOeZdfi67CMgQ==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c2af1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1b-Prb_CKxP05DS9zwcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 6W3I93QlB6VxCK2Nolugt6Nnj8apMnLi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX3XKd53jOydvx
 9u6sdcXW04Ptpo+Gi0mnOrvv2NB7h13SENsWkL2CoHUR7fKfBrx6BYvTDxitnAm0aKY6cjc38PB
 TCqYN6yehZRum1lbh7GVB5N9DaPTGpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240096

drm_dp_lttpr_count() returns 0 when no LTTPRs are detected and a
negative value on error. The previous code passed the result directly
to drm_dp_lttpr_init() without checking, which would call into the
LTTPR transparency-mode setup with a zero or negative repeater count.

Add an early return for lttpr_count <= 0 to skip the init entirely
when there are no repeaters in the link, matching the expected usage
of drm_dp_lttpr_init().

Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 40e19d506a45..1f60c78a463d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -253,6 +253,10 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 		return 0;
 
 	lttpr_count = drm_dp_lttpr_count(dp->link->lttpr_common_caps);
+
+	if (lttpr_count <= 0)
+		return 0;
+
 	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
 	if (rc) {
 		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);

-- 
2.34.1


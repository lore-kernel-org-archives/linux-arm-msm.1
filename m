Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094341C2F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804998; cv=none; b=Nd8vtFk6RAK2z5r0XlB2GYFwuP5rG42ME2ETh9nrDDQfwIKIS4klLjUvQaNmDuaeYaFOX4NLf9kRGzAuJ5BHvxoY6SGalwdScJ8T2DIn4o7NLRcE9sCXUM3p3XnYEqJ6mDhg+xDrj+FGvoSv2a9AYw8qmD473FEomXLYlnbBhAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804998; c=relaxed/simple;
	bh=SKWhPK9r/CD2ee55hEiraz82UixFWuEJolMCsudUorI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDVxd2mrfVCPDDhNxSuDPEX1N4ntC2yVmvnIUS6nZJf/6Ogw+slUOpv54zZyVIJevTVASKvJvE9VmXnkHsw7KhJIEyI9wzlSpRhX5STU9SjSDkuuESFXWlQyOr8oO3TRYvmvBMrsgRrnJ7Zexo/MOycHPVxyBVAhB2EQ8d5I6A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc0onpeF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Onnklhw8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc0onpeF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Onnklhw8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qicN3387993
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CHoRBXMfdQXDX9QzatQyMVjO8U/itkAz0C0
	aNlKdJAc=; b=Lc0onpeFNzuvujB/ZpSyTlb1FCZPn6ECdlBXgCgIS9pzotGKgCo
	jHAo+QfMFL1sDwfZi265kTlydW9+BcnagLYZUS6GmFtA6pvbitbG2+oVkDmy6bsk
	GzCBfneHky9vuO2wMmVQnAIeJekCz0OTO783zh+1zXXtXnXhlMCECpZ67o7fnj10
	iEs0xfTdCxVZEXQraq9vCDkHjgE4pvvaOfATs1QRc5uMzTxQHG3FPWIw7PvzbFoZ
	Ux0gUJKr4gsOwjeuUWNWSFzqCI5N/T3Z8d2sGa6Ul+iLj0A4O1PA2KrdTegSImEr
	0Oyc8igR4bU/QDfEBn1p/Hwm3MVMEDayh3w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275ks77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:09:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so13115131cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804995; x=1785409795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHoRBXMfdQXDX9QzatQyMVjO8U/itkAz0C0aNlKdJAc=;
        b=Onnklhw8dXsvtszNQ4nLtgsudqrEvcFScod4XchZuX8dDopJN0C+yhuV0BB+SHublM
         zB8Zs0ezjNSyMsipC1a4ivcRDH63cCQeHeFR1NoY2jnzjwM7romStF4WMHgLwl2Jlhj+
         781E/ULlBB1BagA++Prz9Op7yYp/6En3TN0N12qNgL5e2TQhWDZt/L2fvGzxdCfzLGeh
         Jbjmno6pXLMxIo5GNG4ViSzmDYjDqL2ySznrcHl4YalbeR5FlfKWWc6A/cnrnsmHfchC
         hsePebORmDhXq9SuiF8S1ZczX+ThgebXVUmfSdv3bGCh5oOgsOdWPdarqT7qbCDb9BIR
         whVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804995; x=1785409795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHoRBXMfdQXDX9QzatQyMVjO8U/itkAz0C0aNlKdJAc=;
        b=p0k2uENPexijZlDSsHlU+G83s+qteDS4OFPJM+YU/dvTucn7+O4QampXq+26rGRMQ0
         qF0HV4FcWNVP3mS+ciBj0+uxN4ihKH6oU54CggODdHA+/Ul6JUR/S6cvRwpg3MKxFC9X
         8FUpe3S+Q9H54FaXznFnY+bA1EDhIGoYEGtozpNDacSsudPu7Vav2Y4cVpdYvH1XMaHb
         c4d0cODQWACw2DEZIzFulwNHez3tjCDCGIwUHCvLRJD4uEeoTnwx5A7CmgzB6+gFi4Tm
         AF/xIWLu12FzJ5Uv+/So/0l2pEEgS9Zk278irNw44mbItlVpsX99ykcMVtkdnEk3kLnG
         C/CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5uu2tE0C6JmvPQKIDIf8JSfLH/9bUKccOq7Ep4xUSuzrmHqUEg1Jy4EzzCue+VZ+2pi5XktNFgiqDaaVj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3iev6JNJW0YmYIapMcEhZ4iEYQNNZrkP7KembtSSfhr8YZPhH
	F+EDE1oljfLAhLu3F33rZZeBMnJceHYMA+b1yivuC5bCDaD263dw1Z1YtqPgaFKXpDlFsxrVG2K
	3D/zBupiv3RVzYjKNcYYxS79VU6h20aaUWCf9zR5QGXNIuEsjGnuqmq9IVk3HXlMTTich
X-Gm-Gg: AR+sD10XwdjyassXVgHqJpY7zhVpYzgmzlaFwgXE0wrg5obJFI7tmxMqgh3MajFUg2S
	Gcqi+4U7rxBl+JaDuZLRZHL1/vHbYhXh4XxyHlV3OumORa4sfJFfX8vWj4S6c1h4voDy95SS2Z8
	7ojbzQRj7BaBi2xFS0fAulLV7m6Kq5f2pPqQLVlcTM85+W83GI/3hFdoStpCwjveqVPHLG4l3GM
	vxCEvl0fhbCx1U/uDwK1MnjxHdFQCbxT4VnEG/Qz1Npr13CypEwTwxHfKkfc2i5IXhHJ2mk7oT4
	/Kr5zmoSGCEBMzGoi/1BVBOa1jqNlHWG9V9Ri0o9xxhABy81j6pZ6e0BJQdhUEHortUsN02Z2nS
	rgIFWsUR27nWKN50LN8rC6pDyEJFSiFybzWnqySlo/CKDOCFA8YU3qtszxPyWry7ZRdcwSHzifD
	TLwrJFjAlbus6UzlE=
X-Received: by 2002:a05:622a:2307:b0:528:1dd:628 with SMTP id d75a77b69052e-5283dfbfe5fmr21224411cf.72.1784804995100;
        Thu, 23 Jul 2026 04:09:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2307:b0:528:1dd:628 with SMTP id d75a77b69052e-5283dfbfe5fmr21224021cf.72.1784804994522;
        Thu, 23 Jul 2026 04:09:54 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f11af2sm214176466b.57.2026.07.23.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:09:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE lite clock lists
Date: Thu, 23 Jul 2026 13:09:50 +0200
Message-ID: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61f684 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qncfPZRv0pdA0gtCnvQA:9 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfX1qclG5VlRno8
 sze4NG/7ZHrzeBizQ1Mu2OHfcp7px+8O0skf76sFnhH/zQzONE0BiNwyj8DHcUghKuN1xok1tk2
 S3QZ7beQQPFD+Bt4sW3PaM7GOerIQxA=
X-Proofpoint-GUID: AVJ7imJVj2Qy4HQGfPCCI7jvxf2F3Ln-
X-Proofpoint-ORIG-GUID: AVJ7imJVj2Qy4HQGfPCCI7jvxf2F3Ln-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfXzHS95gmwGoML
 VDn8PbVA7Cbwqs3IH6UsR815GbvC0WuoWLeLTeYpRyNeaJVtitKRS9qa9KXgRsb8G4g+EUkI+jW
 8Mkw4ed/lKwVc29Nv7iqgaikKl+r+Pu3SqAPfSs7VmtyHZ5liq2Ayf1WwVBjyAcUrvaDFlQE6d8
 6IDIEIwZJ5pjrORi+PGylAHJIbPgO6Et+2R6U08sEvXwgl2Pq48KIs94fIYEobNNKpqJSJW/c8v
 wt1/1hqaVcpScbSZO06N9eEaivF9r0TWjuWvPufV1odk7ehY/r8crGKTp4xCQSw0odox+2dEn+V
 jJijry/jc+GrKDr0Q7HKfkcjTSTo45g/weLjuqqSnbUVOsKzrxhBmRxT3xTPJ3gFN8ZcFnkEzI9
 7hG1Xj0tTNTuUM5v7i0IcG5g+0JmYlV6MT8b5xfPJvxFrbds0i7zs2o8hz3A/6ovnIsGtCSVxE1
 nx5yNUfw7bpCTdwstQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230109

The "gcc_axi_hf" clock is correctly listed in the clock list of the
8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
causing these to not work on platforms where the firmware allows turning
off "gcc_axi_hf".

Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
these platforms.

Fixes: 924f45e58b1fe ("media: qcom: camss: Add missing clocks for VFE lite on sa8775p")
Cc: stable@vger.kernel.org
Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Also update clock_rate lists
- Add missing Fixes: tag
---
 drivers/media/platform/qcom/camss/camss.c | 25 ++++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..68491b16d647 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4037,10 +4037,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
@@ -4062,10 +4063,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
@@ -4087,10 +4089,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE4 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
@@ -4112,10 +4115,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE5 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
@@ -4137,10 +4141,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE6 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
-- 
2.55.0


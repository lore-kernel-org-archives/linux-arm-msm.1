Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC68E3D9026
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740116; cv=none; b=qeU52a+pjxh/luy0FyAy9J4H699SZzfsV+fnoPwpECIQBoUMgT3iDrg/EUpiMIzPufMNeplBDM2D7uYJ0HGr69YR5xClleI+c0bCMe+60pJQ0B8wW1CNX+Zos6sbEjXx1ULGfIuS7GMq3RK/aITEsJ09AWf9ztLmlUCmytDdai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740116; c=relaxed/simple;
	bh=DOrShS5Fw9vASx3hDYSvjTUK0Jh5D8pXnuu6PUkXK8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cn/dAdyefBLwg9eBIsTr/8UzYkUB+bNulrHpLSU+5qAKbnSwyy+so5b1qVGrhEUU11np4PXvOVU8IyavegbJmw9/3oF7ygt7HUrEzrmNZrUh5oL1UWiGePtHZbH0d+BHVC7s9YuRXuVUSXTopaBUTM3XzkdoEEbhPl6x1TotBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgsebSlE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCMiy/Dk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgsebSlE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCMiy/Dk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGaL81209812
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V81GetfDZGr
	aM3UzapUPoHJT/LXOGeWlsYECpijykio=; b=IgsebSlE6+wokvA7azwz642K0gh
	yb3fgHH3xjr8XylZOskYMWopkQSb7d/NSd40YQXK7MiQbQQZElLNLKSpOh8qfCWL
	gz7zkaWynQ6yyj6vBxq/GuleYuvkdx71jrlusRR0Wv97/nwEkTv9SdnZN5kwgJ1L
	kkDRwbQYfpjxeqIVrxDYfn6+KpY9DfWXwU52wCIAjZJ5V4Alylvo3Xv2x2wzQMuW
	ZM3U3Pol6bG2U0RRh4+cXuevN4cxndN+eGjg3EfGxQV6viZ1q51zJE4A2rtLHbAv
	2Q3XZxF70vKyVCG5sxsi1Km0E3lZTzZE6Ku69saGNp3Vcq+2TlKVRTy0DnQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxkenh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so17042585ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740114; x=1788344914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V81GetfDZGraM3UzapUPoHJT/LXOGeWlsYECpijykio=;
        b=GCMiy/DkYYlvWNC1InqPGsOIOK7t4rq8IvJn+E/8V3RD4Q632g85UCwEs/lcaPfnv+
         DdVhKWvwwI0JSjN5O+64KPnHu0ix1UDsphJVrXrxOglLq+L0qx7VXFNCDj/t3Q6jHQXE
         3QA8HO933zacceNuwgey8lU65STA5w2/lf4uQLQnIOHdlzgKWDTDC8IfCDtgFvvwLgaY
         4BATNf4huPeh1J5GV+ahPX67r5kw4zNDX2QV4WxR5NEZ0nwESxj+idg55rDuEMq8y41T
         xG/wWDwv2ypS8oyd7BpMSIoqjox/EAa3slYixdc+STQah9n3Ms443FzsRGzAnCi64oMk
         SVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740114; x=1788344914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V81GetfDZGraM3UzapUPoHJT/LXOGeWlsYECpijykio=;
        b=MjnmXoBaqVkHncYaLTQG097aSQ5FS3MF+esjiRgTrpUjpeRJ4BNoFP8iCK4JGw+BkU
         RhnWzVhRK0XHGXz81aur05on5wN37s5GPZc5svSh0X38mioG1ZdS0ynfgsXpqiYFovVD
         pODTzJe3z/7Rg0/wG/+JJ1SQDFt6UW9xpWVavN77cCFGcnCWEonA3PRc3UUfMBiA11HM
         NDcKmCfdHrxSqarGpfifPAVtqUpGAtYUIMOSedxbOcH73/tZWcPIib8JGYl7hrGZDUVO
         WNzVknkOleFLml4ioAlMKjPy7cy6+WJ2u0jlzwx62qTSE2bNsotd2SLawRn1rYmNubDC
         go6A==
X-Forwarded-Encrypted: i=1; AHgh+RpTy7R3TkLHd03yfQSPeziocWGV9W55CD9kmWvhJ0ECxAqTvp2OcQMqcyhIV2BaGdbfj+WBqjvz7Hq7idOn@vger.kernel.org
X-Gm-Message-State: AFuF++kcnhmhiUgZhLmwIZWtZqSc+0YfZAaZ4O+6W2TwkksmVFlB0rgy
	0Al4X7uIvgFtw05KcB1kvK5sWlUtcnjosvHVfs2SJjZvPsjMde839V8sCqrLYExmnCTrJNiUgw+
	4waAFy4Qibt2Ywa9xGEh2QbCkVYjZ34vIYXn4Gx0x/hCEPG585F0MNXt0npD4nr5pM+A5
X-Gm-Gg: AR+sD12weLvRNPxmt/CAYRPM/Ep5ICf3kX3Esy8rgr1JEhj0bnX2Cs0VRFQIWDZJUCN
	lQp9+SlMOLs7QVEVz3DW6H5OjQjCSOrwOjv5OU48E/U7O0zFc/9d7DSbpMKx1fjWr/Dh554Hc/q
	wyMC2qxX8YfujWBAQ+FQYy5NxwlAj8lDVxuLYdgXaTw/ux+hlZQD0lpHl2FUa3b4pxSiJ9Q6n5L
	y2QKTwFjPbVmo4SfnLXglmgYzyKNj/fK32P/DOQW9n5Tk4pt+atKuihUjO67jMoZ1bEez6mfZPi
	aeswoh6XxdKGbQr2aRAv/Hx/2E+dFlb+Z0n8QbZm4DH2wFCQb1mMliKfNxRNCtG/4dPED3o7iCG
	lJupgNKBIntRUnkyVHVIa1zw5tq5CkE75lIpGoWj2iCiAGlgqWJd7EyA8qF38
X-Received: by 2002:a17:902:e549:b0:2d6:fec3:bd51 with SMTP id d9443c01a7336-2d707a069c4mr83279685ad.5.1787740113607;
        Wed, 26 Aug 2026 03:28:33 -0700 (PDT)
X-Received: by 2002:a17:902:e549:b0:2d6:fec3:bd51 with SMTP id d9443c01a7336-2d707a069c4mr83278655ad.5.1787740113162;
        Wed, 26 Aug 2026 03:28:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm12935669eec.6.2026.08.26.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:28:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/4] remoteproc: qcom: pas: Switch Nord CDSPs from MX to NMXC
Date: Wed, 26 Aug 2026 18:27:46 +0800
Message-ID: <20260826102746.633076-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8ebfd2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=DpeyPZAO3b19OXZAH4MA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: ae9Jw1ByUJikvwe0d6ISGf0XinHLnnSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXyvroxWtIpu2q
 U0dFPg1Ly5S+XVCAeQcvpIAcCMKDFC4ymh7srUx5iLwuCSI1NWmUMWEOc9iOzGc65K10CRg7QjA
 tfBPhA2dEal1coImfKpLxZ/J+cwDd0xO52yp3MVNPKBaIJr+IXIVR9xY+BuIAnmzT5PAkLHz3FS
 oSh8GnakVfYCzCKZxBkvKoDo+tFgttL5NiPfdalviSJJNB+s+EsULjWnTrQ9DH1Hb1EHVvu9RQi
 UxeAcXd0GlkQCXwOJWEgwa+QK8NADPZzQ02ncqTyiScfUXWSFs9fSaJRXV0tvyxijcTxAW5xsyu
 /mF2eXLaZUNHODSKQK/vHBTZSmQSOYBfgoNo5vyir9Oij7q5nq9czZ3CN/3SlJF2tlZuMmh/1nP
 wl4yqlcR9x0XJc4YAwp5sdgHwMRaqGYDCuR1dn/6RqX0wvJRs1VZvZkOikgrCJ+2HwrFhkKcQTV
 VJJSUtzvYNc2FJgLbCw==
X-Proofpoint-GUID: ae9Jw1ByUJikvwe0d6ISGf0XinHLnnSV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX+aguvhSQ0u/3
 aXszCIgo5otyoE9/qEKqRPvxJ/19vcGjWDZXNf1/+2S1waoQi0rpNx2Io6mpReEy9tagRQrUgVk
 MpDEPuzbOCRsxeUjuFTV08bUsEqP5gk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

The Nord CDSP subsystems keep their memory rail on the dedicated NMXC
resource, not on the shared MX rail. Replace "mx" with "nmxc" in the proxy
power domain list of all four CDSP resources so the correct rail is held
during PAS authentication and boot.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..5dd954b57852 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1469,7 +1469,7 @@ static const struct qcom_pas_data nord_cdsp0_resource = {
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
-		"mx",
+		"nmxc",
 		"nsp",
 		NULL
 	},
@@ -1490,7 +1490,7 @@ static const struct qcom_pas_data nord_cdsp1_resource = {
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
-		"mx",
+		"nmxc",
 		"nsp",
 		NULL
 	},
@@ -1511,7 +1511,7 @@ static const struct qcom_pas_data nord_cdsp2_resource = {
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
-		"mx",
+		"nmxc",
 		"nsp",
 		NULL
 	},
@@ -1532,7 +1532,7 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
-		"mx",
+		"nmxc",
 		"nsp",
 		NULL
 	},
-- 
2.43.0


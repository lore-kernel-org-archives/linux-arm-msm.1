Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616154;
	b=hSOFbVvd/kmoS4/U8iAGp8ug0qD+RREBxR5GUw3G+khx3sX5FkhtX5tkwQiqhTfGnVEB
	 6qhIbnjluEzYyHE3KPQL+Yzr38KECjansc70Mmg7mdcdKQ+Gr27BCvAvqgc5ux2RUx0Ew
	 3m/XHUV+NBWvuRK5OxSbb6CHKxDUTLHZbPkhhhGwzy0Sa1uvnGK1eLQjIkS3F9/ORyri2
	 U6Jt7v0uth9KESH/rXfTQzZKndUYltwJp7EGAxCnLJKIEBXuDoh0j/BaLxXy5n9Zf9V+S
	 FEbPCdaNCp7IyFm0RIk7MmUWsu2Hc0cKAAP++SnvhwmyRQf7fqSfUlYiEtOXzsojbow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=;
	b=L6BkU8KB8LbapOtZz00UtfkrTScEIn1nkWM2WEpbqSJSjRIj+puwpfCKOPz3lXQM2bHF
	 U8IKoonAscKyoZyidYvJbtX2vYnU6D2t70bWhzqeCbLWZ71zI27r6J8ljvgyRWN4vy1/J
	 blYNHYgpJ4n8T13UORSugICONIBS6UOxhB4XeWzAB0lhHPDS1m8JPPge/vWgZIayVy4vo
	 TjlI546iBd8mZBKxBad5DLpTsafIC5uFgMq3X7IebU3fyQ4bZ9K8e+azWJRvM46Jpdgys
	 TMzhWCRHBXTDnSVfqjCiaz3/iX67y4bljS+gEwgNcF7CZkrmlFbRgj7gRNHBq4ZMxZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UpwnpaHS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LBbNALc7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E660A383E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5E660A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UpwnpaHS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LBbNALc7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ANGu1821268
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=; b=UpwnpaHSAilrnpNC
	45ac+f1d54RpuYYqvQdisI8oRkg6dlc0WjmS1ZGtYGc6Q1HyuFUlQ52EP8I4JF5p
	YyvbL1Ow+GiHcWsvfMLuysZqP1Qlk2iwa/hZpkOuMuLCs28oK+zCYTdy2o6FR3Cj
	XtwP5cjAUKh5K0Gxe6j1Xi3U2yHBLpWQQXgsYh6tCPbxiJFwXdZ3Y/qmt4hXgrFB
	rQjLc6FX9LeyZETvpFDDocIqAaMhQC2mM2nFBYtgxxI+lt50doQ9yullgPk/ALo4
	vMnfcwCgruxBTjE98/6sOhTU0EHtaKDO8E8FSEN91iBmm78FjCBoCSAMYG3FqLYk
	EjCJEw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h8vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:32 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e778acdbc6so4898849b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616152; x=1794220952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=;
        b=LBbNALc7XPDE2T0HwJNzNlGp80wjiVnw47+20ENHBf7WQ5MfQK9NxhdmJECX3sb+QP
         kFrT/BhGpAryxBgMvLbnBkntbio79mAnUXorYy2jnHUX1+FS0x9Z/zjhyPWVW8LhU87J
         BYEd1DyxcDIexsAwQ9S009lZnlEK0FTwYQEyASmrZjG3/mF+39X31h6e30sv2oZkR38v
         KVboAua7TaBvTI0WxW22BgpjfJYA3LgOBAXx0KeEZKx8fP4QRe2uoRFWEDzyB2juU3Hd
         1MztwVOiNFNURmBMkIYMAlPSwa8UGVMpm3HyxY+3eOFWtrG2t4lSU2SFu4TszlN8OHws
         tIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616152; x=1794220952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=;
        b=ByQVbPf0j0zIcmkwkqsAZP9dRyqxSW6EMxOdR48EN8SGitKbVpKICPOTjZhpUi5ng0
         qAYYVd6O73fTFLeyb2yw9JBSEdOFIdEBDnBLmnTAU+GQawwxITQprm7ADsUUNNB3F+6e
         8fgqqtLpSZ0U8zqOTxdeHIAQjdH0VnHY+en8ZOMMb8V6oDgY7iHrkizfcW3ctgKVkafN
         IdctZEDoRTbAFokokxaei7yH6JOQQlzeSqkUCwFqFFoAmREUz67suVscWsIhiy531ioN
         2OEzE6uzrMaQdJhMtmiqjiuywlXjF3nnv8GmjQE/+dtqjl9WeGhdXJTAOWfEZwNR7FMm
         Wx4w==
X-Forwarded-Encrypted: i=1; AKwUvBz9p3HdfWAAGyZxPm1MhD80IFa+l/SRcByKhHQdZhNZN2dEyGHsxrm3UB+OpZBCOjBC3GFcDJdzsZDg6Pc1@vger.kernel.org
X-Gm-Message-State: AFq9FYKKtymm8RcdOlscjaXdeiOUmWpwWP7DWDvcxTtreyUmoIOk+K6y
	n2092ywgMFCUFkDVKatQvgROcV/PN3kGPH6qCbQHtlKVndyt60dptK4I+lj+m3QSJ8K18PPXk50
	fboHn8ZdafDjRG5WBHtpbG+rxp9Z79YDSGmhGmxJI4tfwflkuaNaYgnzOkOw/I9TikWe0Lt4CEh
	nL1LI=
X-Gm-Gg: AYBFou3Mudd9ItSfYRzbSZg8UF00tVDdosBuDHNKxqswyeQH5h8jlMYGqfHUZ3QtgRb
	w5nPFNzrrh12VqBVsWvspZKJIiZK8AmSxkBy55vcbdbSSps8eymZNdevxmhDrz41EjYEFGKLj8y
	qWT0qSWhNcZryNx4QWLLlBcjVXnJm4zNjWitfNz8ofMXDhG9XN3Yienu4OmsJveiNt0+TlS0juw
	AIAka22FTheas0lFKbdrThjnsxjoQGuRvPkOLDKReOlj44yje0s6HThORNXhmZvw3GS2BMte5GU
	lMXvKv+pet80yep8DfPghvQRe4YvdffSJKVlDwSJSXMwc8/aThwdlCCDCYW2mNBI8ix0quZs4QI
	M5UDhCRSb/hDNI3JPedGAmjqnfGDgq4LmTp6AH0dH0qjwzEK9XYvs4JlDB2UfzFbAtigxeLYKTC
	kl5LQrraDP0DALORQuyfgybeKnIqIK0gWjXwDPMjODKu/A1EDC3S+RMlFe2+s=
X-Received: by 2002:a05:6808:16a6:b0:4cb:f21c:a79f with SMTP id 5614622812f47-5640df8d97bmr5915321b6e.39.1793616151913;
        Mon, 02 Nov 2026 02:42:31 -0800 (PST)
X-Received: by 2002:a05:6808:16a6:b0:4cb:f21c:a79f with SMTP id 5614622812f47-5640df8d97bmr5915303b6e.39.1793616151442;
        Mon, 02 Nov 2026 02:42:31 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:30 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:16 -0800
Subject: [PATCH v24 08/15] media: qcom: camss: Allow CSI2 PHY devices
 without CSIPHY resources
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
Message-Id: <20261102-kaanapali-camss-v24-8-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vz@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: 5EW4T6lD0jf3BcBmhQ2ajAHWW46by5Hr
X-Proofpoint-GUID: 5EW4T6lD0jf3BcBmhQ2ajAHWW46by5Hr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXydnGKKtGV4Cw
 KszP7Q8Z/0ISvKxXW5fhTy6NMOdGDgzWAGlw9Tl6S3HbeHcXRcxNAvWsaS7hTUllubuMHXxZnTM
 VZfcvvx0/t+3tPBbD+7UTMoaqYWJO5Q=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86918 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=2_0--xn6cTixhlPqFr8A:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX9AnSkbtT73Ov
 6YLkGlptJhu/wFjKCHJrNgRo50sWC3NMwUdI1J7/Jc0Y1xZNx6mK6ujVR6sEl5hPDek2lOeg9HA
 VwuPRDPGyuiq9H1VUDFMuDkTdWzyvxu8LAb9dl7u+L4VCEAMtOvGoDglE5dPZurjedkvwea31yj
 FiEOp45xSe5O1grd/WgiYml4DtIue6s9J7EsTbPMjuT+A/6io5cvNP+yLfU7bdEHYeKPJ1gGtZj
 UCV42SI2kM8KaB4KLER5ZM23f7qAZUhZ65zvftTSHWIfZFS8JpY61StBnAqhjqX60vN+yD28z5i
 lD3UHigu6KMkeodOgxr/8shJ4MzkP6TfFjpi3aokKa2e00PlgP/UDGWRmr3YBGtQm8xvacT8Pl8
 vMt6efdpA8bFOgYubMLuMTAus8EPdNx7IboW7trdAu0jwo0dRqgd6+yqNEdwHM6MMnznH+L2JPt
 Cselyp8XBD34ApmNYRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

From: Vladimir Zapolskiy <vz@kernel.org>

If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
there is no need to provide description of legacy CSIPHY resources in
the CAMSS driver, therefore if CSIPHY resources are not given for some
supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
 drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef228..8ecd514451d2 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -799,6 +799,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
 	return ret;
 }
 
+/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs */
+static const struct csiphy_subdev_resources csiphy_res_phy = {
+	.formats = &csiphy_formats_sdm845,
+};
+
 /*
  * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
  * @camss: CAMSS structure
@@ -808,7 +813,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
  */
 int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 {
-	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
+	const struct camss_subdev_resources *res = camss->res->csiphy_res;
 	struct csiphy_device *csiphy = &camss->csiphy[port];
 	struct device *dev = camss->dev;
 	struct device_node *ep, *remote;
@@ -836,8 +841,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 	}
 
 	csiphy->camss = camss;
-	csiphy->id = res->csiphy.id;
-	csiphy->res = &res->csiphy;
+	if (res) {
+		csiphy->id = res[port].csiphy.id;
+		csiphy->res = &res[port].csiphy;
+	} else {
+		csiphy->id = port;
+		csiphy->res = &csiphy_res_phy;
+	}
 
 	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3857515aac7c..30c2a0c89100 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4810,7 +4810,10 @@ static void camss_detect_legacy_phy(struct camss *camss)
 	struct device_node *remote;
 	struct device_node *ep;
 
-	camss->legacy_phy = true;
+	/* Legacy CSIPHY description implies the provided CSIPHY resources */
+	camss->legacy_phy = !!camss->res->csiphy_res;
+	if (!camss->legacy_phy)
+		goto done;
 
 	/* Find first remote-endpoint and determine if its a PHY */
 	for_each_endpoint_of_node(camss->dev->of_node, ep) {
@@ -4824,6 +4827,7 @@ static void camss_detect_legacy_phy(struct camss *camss)
 		break;
 	}
 
+done:
 	dev_dbg(camss->dev, "legacy phy mode %s\n",
 		camss->legacy_phy ? "true" : "false");
 }
@@ -4855,7 +4859,7 @@ static int camss_init_subdevices(struct camss *camss)
 
 		if (ret < 0) {
 			dev_err(camss->dev, "csiphy %d init fail\n",
-				res->csiphy_res[i].csiphy.id);
+				res->csiphy_res ? res->csiphy_res[i].csiphy.id : i);
 			return ret;
 		}
 	}

-- 
2.34.1


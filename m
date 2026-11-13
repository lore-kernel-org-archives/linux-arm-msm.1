Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548052;
	b=CY4EJJ/zTQ5mo3oDDv8X/55wq2p8K15q3G4jbCjn7Urm26Tq32Smr1EqQ5xGCTYuaNwQ
	 K1FHZ0XEQrjRoFhw5kcvbDaedaFsmXPBlUbjc5Jhb0cS3O2prklXZFC5YIw8MtXe3r5Wi
	 kjG+6o9Cds6zajyycBQ1+6P0h9q/q5jk07y+e2JTTw34QQYAK2OHn8Kmp/h0L93ayqIXr
	 64Q80c9U976vez+C8tKPObSnDLLxOy7yZ7cXG2+tgLdX5/S7SEE1zb2HqoPJ7Hh0583XF
	 f/WGHnJKOIPxwdBMs+ERGK+4RhTSXvgaqk14rHkiALX2qDMCVaG6hI8qXHHhjHVxOrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548052;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=;
	b=MXvz3U6Sa/qvnH2d0bZ1vfvhgPQrcPXNxRh1w81WGaX6wBDOWoGWXK5RaYvV9njz1MhQ
	 C+u2EusjE0K1tD8Ua9PbzEamvPI4Sp+Gn1/NTvCcCDG37RMQLnwuwvkbPbYNtMcCSs3TX
	 vd/JzWvqRGXhVFlm4EWk2e3RDOYHUuLFlUrtUc46l7XboWF57FHLcXhni0xkhehVsYks4
	 yAZN+8TWEeqCj2CCobNm/LG0C/TrbrKuHwLhXx9gOLbyptK8mIMuO1IjsPups05TzAfap
	 8ta9c3vDkoRkHqlz7nZo06t4xFzA74jrhllT3fxGgnGSms6cG13rUc7PsnriORT4rkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWAqQbDl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SPx9Dmk9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27960A5BE6
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D27960A5BE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWAqQbDl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SPx9Dmk9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD575Wv3075827
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=; b=nWAqQbDlmo+bpHw6
	6kKcxDeVelCwg8ZXGH7dq94SA6ysbO+KK1D24ljg7OtxvreSEUyzhLSeGoK1/njT
	Ihss6za9pwI/QexkKmpQdygMOKEcAd94EleyuSEQNNoBrJR9bn62Kl/GNpQLYWDX
	e+vekL6GV5CHvwiedvNhDCg0wYqoEGQMsqv6IPog35lAvC0VUUd02PEzUMMUSM9+
	iseLgm37WeB00kG+j4iqJSnoOongYwWW4aBCvOOE/jhQs8nT3LvVCyT0juIz8Rjb
	wc4XGUXwodUF1PWN0KSzJbSpi4THjxKd+GZzeVlG0edxIX+V8GRWQZqab82xClzZ
	HIcjqw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re4tm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:10 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-7026e2e80f0so800119eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548050; x=1795152850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=;
        b=SPx9Dmk97fFj037fv0vQrhUiXdiJGMYRWtK/cHCLLKan3DGaA6oQQ3+cYr7YARiSZM
         x6P0nrjBTuG3Qk7DuhJEF5xPcKPcfvM+kqvwALkp1tiCoqlkl5gZFRU9HZw7/1uu5Aoz
         xTrdVo6tCfXFLjeU4gwqSHhfYtbE7IYCQ/6hQYEQ4vZarE1KYtR09E5ITskP86LFKaMe
         dk1byOD6IXK90yVa5+5hyKb4Nf4CIdnQfUJRaDfv2afXd63UXQFY4yN7EafdZiS0niT1
         n5+A9LYuIpnOX3/ELiBdB26d9DpAc3+4ozjjZs/rH1iAkdn/keltrJ8VBUZgodyv3KD/
         meow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548050; x=1795152850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=;
        b=eIHh95YeNDN/DuI9G9VUy+xJgUH4XSq3LT6qUyk5Gbzvt7m4ESfn+5O976qCaN00RM
         MSBsrNT3xMf2dx30aFPd0PbyOxODboxyi7EZuj7w/lS9+02QbNqD4MqO/3b57A7hoMg/
         8Y/HAQjWde1VQzwB8tVQluboLiiWLOGQ6tiNkTsB25G5X0DIF0X4gR5LRRoGC+msfnvj
         psfivUASRwm9ZT8FNY2lPfJ/sPir2/Pqn60SQOwHBbuom9s4UeC9JMwRmxpT9dC8dCEZ
         tGoB6p2DPmYeu4XJXoERRdSBxZJDw8ieqLGlrm8TKMj7qZz2uAQLlYqypGh/eM5oRDVl
         KOog==
X-Forwarded-Encrypted: i=1; AL+hErEy/CXWeoo+zr0AZK2xcOPkVJZ5batuY07yAu90godAHnCAbPYUFjoWP34X6TSOOKkmz/yQT37xfzbOqGwF@vger.kernel.org
X-Gm-Message-State: APuU4Z/8OsiD/G1PhhkhYMy+nsP75x5VETOwuKX/CDij6YKPgu4Zq+tp
	f+nVYFU4IbCbFn19gq4jX0ZSCXpz3UrWLQU61Zh2sR1tLw20QF4lnwIXK0kyO/q3rT21uBNEMo/
	mbnMHrZmfr/ULB9zj7I6TAIP2Wyu00kFomSlJ1/k3w6sVl1D65li3LHazQp6pEe0nKCtz
X-Gm-Gg: AYBFou1lAA2uHMWlPBz4orNv7E7qqyIQLXg45+yun9Q5d/T100QMRmCiA2EYa42Ieog
	IxlJk3SHn2lrz71u3OSutxJiOuwS32FoahhlorpZZ8BG1O5oDZO2BEWhK3/0Pt7oL7UKcH7DGn5
	d/hxpxqh0Shmui7KovdF8FRwjIReDzaRjGyrsv5GIXtfuDBeGJNtW6EIPd+uaJAA3nsCD/x3/jd
	Gnf7Oo+94xM4h4kmokTlw62A+lAuKL1338vX/OtXh15l8/dx7A5sYBCoIztAiomYr25conUitvN
	k/5zo2xDEj4Na3AnDpXo/uhO+JXYIxDW+yjyyMYDx0nx3vNdSY4UqJUx5fAMeKgzrFA/mEIzSCX
	A/qRvPlFfwjDcHz1aPBfZp5/Y4WyhtuADVMwAepFSK6Tj7UR7dag1veGB64z5FmZaWhPgprqEOe
	jlAFzN6TFEFyMMqcmRANA/di8wd1rh7ePuyKGIHqYEQJoYNTKFwbPbQ/mcqT37
X-Received: by 2002:a05:6820:1692:b0:6f8:2346:cd78 with SMTP id 006d021491bc7-71ab4cd949emr1026861eaf.5.1794548049754;
        Thu, 12 Nov 2026 21:34:09 -0800 (PST)
X-Received: by 2002:a05:6820:1692:b0:6f8:2346:cd78 with SMTP id 006d021491bc7-71ab4cd949emr1026840eaf.5.1794548049260;
        Thu, 12 Nov 2026 21:34:09 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:08 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:40 -0800
Subject: [PATCH v25 08/15] media: qcom: camss: Allow CSI2 PHY devices
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
Message-Id: <20261112-kaanapali-camss-v25-8-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: CyvGrLZ02TC9RIxS0rM8R9essD8Z4D6u
X-Proofpoint-GUID: CyvGrLZ02TC9RIxS0rM8R9essD8Z4D6u
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af6a153 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=2_0--xn6cTixhlPqFr8A:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX78oHom3piO7O
 aFXexyU3nGC8pFmNF0cDzd0H+eM2Qz734M72G5uQTKCbG4rb8Jq7J51rGTOe66Ka+O/sWFk49a/
 6kXqCgTEcHOn2kcny1TXOyCRioBhjZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXytWV58FDyd4l
 oNpnq9/5dr3yZfQCA4DpLWNhNn77TYPpb3FS4ngKzXcyvXJ6LWWSzajHunMF+AlHOxl1J0kpLWl
 X//UID8XFoFOjrGvAnHZOIuedsei/l48RLgjK5YqAEeTeGj0nagVPinXWcY9JPwaoDkw8QK23Kj
 Ccr6kE3bDzYbxvExusSjHkXOFw6au5qjdUrr8PyZICCjW5Ohe0i4RFpaybvLbsCL/wK6VjpZiV+
 8Z5UWxQutOa0nAi393JvtdXKN6+9yYFeWwSDCaJbUFSW38QJ06LO7LtmZAlliSJ0G4WtJkB2aXU
 +weINyVBDhXlanuJp2NihQEj926Ae4WuykgXNREXSFtBLFioVoiUXyUdPUEzn7utaoifNd879Yl
 TOci9htAM9zqxz0fSuXqEkxv1sntjvm37uivF9uBjN9r9p9lxHlHTzPLDr0n30W8ARqjUe4mHJb
 Q0UVOKoyDKfZ0IoldeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

From: Vladimir Zapolskiy <vz@kernel.org>

If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
there is no need to provide description of legacy CSIPHY resources in
the CAMSS driver, therefore if CSIPHY resources are not given for some
supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
 drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index cdb803843792..4db68aa2a7a7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -793,6 +793,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
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
@@ -802,7 +807,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
  */
 int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 {
-	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
+	const struct camss_subdev_resources *res = camss->res->csiphy_res;
 	struct csiphy_device *csiphy = &camss->csiphy[port];
 	struct device *dev = camss->dev;
 	struct device_node *ep, *remote;
@@ -830,8 +835,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
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
index f7b9c71cf263..508fcecadb79 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4808,7 +4808,10 @@ static void camss_detect_legacy_phy(struct camss *camss)
 	struct device_node *remote;
 	struct device_node *ep;
 
-	camss->legacy_phy = true;
+	/* Legacy CSIPHY description implies the provided CSIPHY resources */
+	camss->legacy_phy = !!camss->res->csiphy_res;
+	if (!camss->legacy_phy)
+		goto done;
 
 	/* Find first remote-endpoint and determine if its a PHY */
 	for_each_endpoint_of_node(camss->dev->of_node, ep) {
@@ -4822,6 +4825,7 @@ static void camss_detect_legacy_phy(struct camss *camss)
 		break;
 	}
 
+done:
 	dev_dbg(camss->dev, "legacy phy mode %s\n",
 		camss->legacy_phy ? "true" : "false");
 }
@@ -4853,7 +4857,7 @@ static int camss_init_subdevices(struct camss *camss)
 
 		if (ret < 0) {
 			dev_err(camss->dev, "csiphy %d init fail\n",
-				res->csiphy_res[i].csiphy.id);
+				res->csiphy_res ? res->csiphy_res[i].csiphy.id : i);
 			return ret;
 		}
 	}

-- 
2.34.1


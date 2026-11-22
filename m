Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376492;
	b=jhsSjT/derMQbB6hsVwMnjYs8Sy1jyS5iXPE/nF8ejU7WdNLOUat23L5P4bkcF7VsV5W
	 xwsfGHmWC7gS+BX1f9zsZON6IM3Wi6QjbLMSBpv6CCQo+6wrCa0+Itxmd6MIDcLqj3tvU
	 yQfz65v1MeDhlSf2NVGhPMLPhjI5UTPTp9pjRm/k3JiKh60F4Wy66BVdVKBTt1F5Ul3lx
	 hzVzZMFMxGQit5JfQ/eEHgdXd+Z1JjZlHLSjtrG9jbsTZO5UKKi3WoDJ5vxA+94um+BsV
	 2Vv2O4TLiVX4JHHrNFu4u1M1UKE/IGh+63YTilPGOsqBnBd+zd0KjZMa30SWNwzQYAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
	b=nyBvh3LL1TAjRJDZ8swN4pfqlzaG3CrsgWwQEDIGAVFkwsiNNv2iYIzv7VyLSdOpG7Ri
	 lxRR8pMT/RibEG0u69cvM3cwwsXufEbo+u3KT/L6i0wx95xEz7U1C/ybK1ev61dkaE34J
	 6xWnds9LyilVU9k3x9GhsYwEq8kaLcGoV0NHrUH4ihi0WnJENi8BnFIw6cIfgusKdcSav
	 itTPf/U/LGgQUWpqYB1L7s6fJr3hybeLoOffSehAg+OIeyfJQ8o7P3T7N7O3S/sGASFnk
	 H8BIONLQgADgfCwdM4ki3rk6p1Gi8DeoLAJd4CYXamVu33ffJgshOmF1wtootZT/Ypw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaZcjbGn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlP2y1Mk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5702E606A680
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5702E606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaZcjbGn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlP2y1Mk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGV6tN3986376
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=; b=UaZcjbGn3TKsKDJl
	LTnEuIUZvzso3Ez6PKujRGseSzEHxp3rQ80tLfEES+2Mx0wjvxR3epUAfM91udkv
	btk6Kgi2bGJC5UVSSsLlMEs3I6tKkHpqETJThdz+kAWtflBHY1nqmbduerjdtK93
	04tQrWwQaqPG6K1oOI8mexzLei4Zl1e17gfgqDtdceBgxVuFstXT8R26GArO2D2m
	9OaTYwuWMJQFrDpI9s83I/4D4RLG2o7DdC5zJIGZ4K3KTb2ho7JP/O/FzSS3sG+i
	7trNKwods2YCZp/ZmvQnYvfcfgO8kvz/Tlsa+x/0hbA9sYlrrT9V9dsdVWk5WEu7
	Hkbexg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu4442-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:41:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso3807798eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376490; x=1795981290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
        b=LlP2y1MkHTxcoBaP7zNBlC4lSa2q4XsGLohm1/xx0MOjMJgBmrPh11Tvj2S1pdONuE
         aEXd9Bddp/fbqFWLCSjYe56o+VC6EJE1X3MJ+ukmlzV0BJCt7s2avrK0O7s9w4kmoVg6
         1jt3eyaLA20Sw4BUaMj8h8bQx3L3ql/Jo0C9UqRugs/zKQq24qxov/qQ3twBcD51W9f2
         RE3bfzR38XaGL7kQpCsahoXdkzWt6jg4myUtjpGBYwWckErizaRwP4TB8GBE7CHHH/tP
         yo5rjOLKgo6YCKnm28xNQ8jjz1q33dyWhbITIxFXLbSbuAbLu1YQ6/4PohefQohXzS/O
         TEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376490; x=1795981290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
        b=onf+fQ2dDlfyaICLz4dEmHkRhPUvSiJQf7dQmfB1iJBOh/I5Bcw3BYHdgg2E+M2hfH
         Qa4E0ltcp1GR+261FfbBSSvZLAV6Pb5tyWTt5Gvz9khZrndlE1fUG72bTXAf3QLuRF+E
         zk6/Jz/u51+WaPbYZ7dy+irktOrgtp3w2LpzpdtvlgRGIZ5ScdjqLcg9Q4Qne0EuJyOD
         6IV4ds51jrhqv1CvGTjMxZmQ+LtSdurH+ZFWuJGOPB2oU3PY7Kp038FkgY5sQGbukuTw
         QOQ2JWFXyJD47tjOc/uiD1ZqnFNoMdJ9gqRmhq9vS1l1FHSwGdIO+jmBi8kP92BYCozg
         /thg==
X-Forwarded-Encrypted: i=1; AL+hErEzEts5NY6k82HjWoxAmtw71wYhN2tZOdDOzUuSpVNqPtUUs88O5W1d/5zjrGrU2pDgi2rn+HPaW4UGj4lm@vger.kernel.org
X-Gm-Message-State: APuU4Z+xx6OsqyC4Nawi6cgDeBq/ZR8w4JWvh8kBFv27fhVkSvBurl3F
	7e60cncNadkMYng39go5dQRjN9S1KObxloexHxBXHwiA0QXftm7XvXmRABAKxBrDg0WyQiOQmKZ
	DkkHfK2kPpI+LVj3KonEE8R5+s+HqNRB50/wcATZzU3vqx4dLxjFNZXV6j906wDsZBHrh9+VQ+c
	C6
X-Gm-Gg: AZFdTZeROeVGLqZwtew5XUqqVy2Wr4TtlTlfubA7em16kA7VRD4J8StGdVCACyp2r4x
	3J6Nh7EcI+TBqhlOmSTyTYehxPvRDPb1dP7StNl7gy5tFL2PLCa9bSK118pKAB86Ka6Sc0feVxw
	dNrc7QuLRv4kmKZCFbjkEd0JyU4Nw17SwioORyQfb5ulrf7q+WfO7Szp8VS6a5nxrLLAJJt14wk
	KuJOno1GJ5aE68UONsBUKBI2UXKaMkTGxpl9UsNGBSS5Y7iMH0L1tFy4yn5ay7zX6C38UCOjdaK
	Hr29bFz9qz/9+3OSSDVEj9bmSAJVGJDsLFFU24YZ140US7BVcgHEJbz86eGtjg2G4X2X3JF2P4S
	XgY80RMTi/ETShKu2Rhn8iYa9kbZrxblQ2VwXm8mJ+HXUD2KJwO6Qed+jwVxRy3r/iDUXM6MC6f
	BNyW1lAjhFow==
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr3124316eec.8.1795376490192;
        Sun, 22 Nov 2026 11:41:30 -0800 (PST)
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr3124301eec.8.1795376489687;
        Sun, 22 Nov 2026 11:41:29 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:29 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:49 +0530
Subject: [PATCH v3 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible
 support
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
Message-Id: <20261123-shikra-machine-v3-4-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=1890;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ADHxLIKy80YYC4X/WhkVFhvJ5Z+R60FIHCh10Djdnek=;
 b=MYmePnWbGhM+LBfRzuDNc5iosZycgXUqbbFjEUXtFtc4uLHlU0KUIberGaJgtp2yMw6gOJcAW
 cdCELuWi5QGCMFzrCtLiUX1l8WlK2G7n2iiyQ8V/ELH3cTBudZqqV6W
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: LOCf82WOXdfe71C-bdf-qk3DvajVU5t2
X-Proofpoint-ORIG-GUID: LOCf82WOXdfe71C-bdf-qk3DvajVU5t2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX84D5v/9YJrk7
 aX28mByZ3mBdFgLhD3o8ELSgvipxRhXmk1pb+KDDgNcxC7cZWOfBiHoXv4TI6t31kq9AVXFkug7
 xUIdLU11ICsT9yIIxOD1PpYjpuQK1DgzhkY7joMVG9M0RJnwsLRyGOrmWiD/ayILHsk6XiTGOU2
 Pg2sk87IFnLqov6+E5OWalv78CBV9hIqEIjoC/FptdCKmm98FUQ1lD8KECB/cOOhZWsP8zLU4vH
 wgU4qRQaqG/Kr9qoEO/weRm0YpID589z6wZ+NC8ZfKP4pyqJCsHHXq0hOhoaHu7i719rhYJ0tC2
 xULPur/ln1MD9VE1DXrYtFQCyKsXJ2+RZ4APlHYqsf2hPmkXguSGhWIMvgzGo0aztChZEWKbc8w
 9ErulJB8jn3ZdJ63qsSYzINNqwYRuFRWivzJCCwj+mTO+6XpyxlYt/VLLsEj2NcLFqRiE2/YyfA
 6g5ybiN30qoOhDemHPg==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03456b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wXg-2A6JSwDC41Kdh40A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfXwysHebu8jUJw
 8RRSdBRrh0omDKb5lR6z0C38bAjhh9dzCBjfPuwL2OWYCgwR9r10j3inlfHcuoy0vMqeZSSZt0E
 XHXZwypdsO0aaspfNwhcxW08Dc7jAvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add machine driver support for the Qualcomm Shikra CQS EVK board. The
Shikra CQS platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components with modem-DSP based
audio processing.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e1d701a1b1dd..bf62e8330276 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -742,6 +742,19 @@ static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
 	),
 };
 
+static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+			.id = AIF_TDM_RX_2,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -812,6 +825,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
+	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1


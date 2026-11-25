Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631038;
	b=p0EC8P/HunBC74KOZfNzPwnn5cMeh9pfni4N80K5EBPqIYqrhmZOfzcnE6YXi8EX6XvD
	 +6jOq0lwDwssxGKJ23FnDyh2KCK1ybwvaab6MNf1PXcriBih0c/3CfMRttDa0sKR9XK5I
	 lObLWFTsPMnnTrXHEOopkEl4zWLXNSQgFePF9I9HwpK0En3QFz2ffMvtD2/Sa1i47/ExO
	 xSkFwNBOqlN8twN5TzqhwCj2suLLI+WbDNXqQeFQ3S2C0ZTi8qiuUNyfRqJSk6e2Z9oqd
	 y35s9N+KBtj6XOUq4LjMuCCLZr5ENYvGaM6bykQdee373rOmZRwNKBO1HNIktz79exA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z1XeamohrIedhgwmhNg4I8r5d4kbVDxOY6/Z0j0BI1k=;
	b=Z2wATChSoxwjTgKSCZI3kFMe9/JzBysIuCC9R1QB0AH0d1Kd5tuaxVVDJfbVNBBDkG2a
	 jdMdk1REi/Cr5QvUQT8wR05mZoNLsIZTydzrDenfXzCmVXTWuUrMb55i41UsH9QC2m3jS
	 W413VuvUoQNZVd9z97SpzrbGeuPjZtwE9Kv8rAbWiHXE8KKCUQ89IEtNQfWjkVpzBfvMe
	 tULZlk7o0f/W4Xw5RAitYn9PDbxPNpMR7L5Jk/p75o9iw469DopqiWub8f97Z3BCgVl4/
	 9aNDRmVqTzE4NFQDUWZp8cLpM+j1eym7FqeTTz3cBxXQefDjwGQaYyC+aITAEznNYag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4C4b9Yt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwT3XJ22;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31E606A68F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A31E606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4C4b9Yt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WwT3XJ22
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQJqL3008006
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z1XeamohrIe
	dhgwmhNg4I8r5d4kbVDxOY6/Z0j0BI1k=; b=p4C4b9YtZLiMszAJOqJfAz7m8Sa
	qIQNrznzZnGVQTg2CVo/t54ikZFaF+toxVq8a1Sw5RtSXv762PhhNuWRBSIirBEU
	1ePL7h5qzzoN8Q23/tV3oJPjXwuC24+8UfjvOOv+PTZ9Eu8xDRXbIg3jndSeeOlZ
	mcKw9wMfTQFSLZUBL6W2c1n0JMmMlKG6yFhkXqnDXKUa0PnQIhBsKfzetN/++Iib
	UvTFWJcBs6QQAjftFtm/qlOwY2uB3YaavR+94il9iKEj3rJ8EL36saXXfwEOZHid
	EBdyvLVyooRoVQhMboClGw84AazeF2518BYcpui8WtzrhUJdPj6QzsMQoXQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukt8qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:56 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-679f81d5d7bso10073842d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631036; x=1796235836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1XeamohrIedhgwmhNg4I8r5d4kbVDxOY6/Z0j0BI1k=;
        b=WwT3XJ22LNMFhG2g14/ft3r5qQHGJ6gs0D5a0S/44E+n/R7yNMkxVJnUM4e+lU5mmg
         OwYBd93A0Zvp7b4/Lc8LRo9OJMqhHq6qbjzxdCRUDj57Gwl7IHMQev2Yffg2I/fivYd0
         kZ9YoWODWSgNm0X8hwsYEeKvuxGeKvQ8zksycBM8A1H5z4SaQEvDoY8o+IuqsPE+KryF
         PKTgHOMtFq1IOJUsAP6eo3aTcdtl7AL85YY0GLdoFHQsbl4+pjB0c0pKRIt2JSPDJ52j
         v+tSqHNg5JNT154TdNzGLiAqllFtFSUlpWx7P+VpmRgVDIS1ChTkI79lHwKhD63n1C2D
         rLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631036; x=1796235836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1XeamohrIedhgwmhNg4I8r5d4kbVDxOY6/Z0j0BI1k=;
        b=iHdzF1l+xc924swai24QldofYKYSfPtiySDWmQ3Td/pK6H2YRApeNziSwp+Db19v08
         ZLr2Fv/NamifBji7QsqHu3rYA4bmMcUODEopsoH+maLVfW1BHgv+DpIlQVD0Ajpt7bSC
         3T9/uqY2L0HVIBWtlpfLreGNKQYrhqVNLYitpN5/hv+CLetZ9sOMJG8p/ldhSXw60yUZ
         rrjOBd/5wQ96W08lojyKXQktOAWpfVYM0NUmT1Wovx+df8QdPtmObXQO2BiVxBDwiHsL
         jNkTU8nPbmBLoNq7HgvvvKXJhSCozS58uzCL3PaItGUP6BElRS7a9YWQFvg5RwvFm1u4
         otQA==
X-Forwarded-Encrypted: i=1; AL+hErEiPAzvhRNVYd60Z4+3cz3dFJXr6k5a7D5AM3pGZNW2YISshm4wgqpii8G2hhFNG72bO4B2GP/HA8uafoJv@vger.kernel.org
X-Gm-Message-State: APuU4Z+LoJgqkaDCT06/kkUl91dCQJz2puUVRD0WOwf8787h/IPiF63b
	VgKgC3MxZ+6t/Jc0fElGO0IsU0bpB7IAFxfASY+9i0RSiMRf6vO+4SkPD1vFapPDzmZIFmj3z0V
	Xbnte9q+2O2f6Z4LNGAm/z7fCVkQpjLUfnU5K/eShsiCBeCYwTDw0VseRa0yh6eKYUi2W
X-Gm-Gg: AZFdTZf5bK/k1o/7BkQrruBfizfrjMAHwVmnuf+kMelVhbEvCJX3tLWW3o92eAaiJG0
	WN6SqN9C87KWitdW2zbTdRbTuNefz/PkUQmssb4E7wa9RoSnw4CLWp9aZzz1I2sOOPmUSnCjqQY
	oHpMn/+1JFJN/trjuHwWFx5BGkAkIpm6cq74NqHwWb2jgMQT7Ug2kBJYHvPOeZtctqG+DFZD4IS
	RpvNyr3y4e67AMQaApv4fjwNo+689zT0v1xggl3BlNgCneSg36jMWrGO/vi7ubV/vWph20P+pJB
	GIWK5Y5eUryvKQiWMUMHtOR3BsKPiOA/6ecCro7XUy2XnWQ8BhfIoG4kg44ANR0Z5SwJkLgxdVw
	AteGWAN/hkIXQspYdkda5XkLXvr5C1N1QU+0xK1NOptRguRmB+vYe4rY5rVRHG/rsaQD4lBLQ2P
	gA0IQq
X-Received: by 2002:a05:690e:191d:b0:67d:e4c3:d85e with SMTP id 956f58d0204a3-67df43f3412mr6388665d50.46.1795631035838;
        Wed, 25 Nov 2026 10:23:55 -0800 (PST)
X-Received: by 2002:a05:690e:191d:b0:67d:e4c3:d85e with SMTP id 956f58d0204a3-67df43f3412mr6388655d50.46.1795631035276;
        Wed, 25 Nov 2026 10:23:55 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:54 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 08/12] media: qcom: camss: Add streams API support for VFE
Date: Wed, 25 Nov 2026 20:23:22 +0200
Message-Id: <20261125182326.2767771-9-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b0727bc cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ZovgdgjKAAAA:8
 a=EUspDBNiAAAA:8 a=pvsxG-_YmC7UNMcg_GoA:9 a=yHXA93iunegOHmWoMUFd:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: ZvvRDze5jAp2UQirGHCN3dswwiag1o-A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX0sQTOSA2IpRZ
 hIBjEPTU2Rl33XTIsT0R5tcUULL+FIbCHW2/qMe3BEyV371jGy4vJGvnY/DOmsBxTFBYe9SmQyN
 iRjbqOUsJg0SXICsr57fKBa8wMfbxKw=
X-Proofpoint-GUID: ZvvRDze5jAp2UQirGHCN3dswwiag1o-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX3jU1lBYwcJfw
 Fz7ueQix3Zy8YhER7QsToJpcvH5krxQiV5XA4iY0c3pzF1R5ZrZXGJzoVoGk0JlIyh5SKk6u5RY
 rqFhtbXimssYqUah6MZ7l4Z99aYIX4qw7lzIZHP9QFrhXUYrcVqE+OSlvA7JAKlJfLBFouVjMRo
 3LWjDn3Y7cPPIsoigikK00uDyZERM/Cq0jk7gK9BnWFHeZ90/gtYrB+g62waF2O7ro4cNRL2Y+W
 nzXh6jMcozxFuseax3rSQM76a8GsZkgyaaT7qFXWei4HHktkSLqCZR+27W5YOUcVyFCBd1flQGX
 lhgerU9itrbXDcTTz48UIcTXtdxua9OFG7rkOfeATK7grfVGGqtkbDgxGWHBo540oHSJ2HayIQy
 N4LR3KX1758Y/Vki21ZDPhLqvKxogChD4c+elOfKs8fEiWlKPsqBTpEkW6obc/YD4V11esdzcJl
 xr1Mo0XxwA2DCbbtv7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Implement the V4L2 subdev streams API (enable_streams/disable_streams)
on VFE lines, selected per SoC via camss->res->streams_enable.

VFE lines are inherently single-consumer (vfe_link_setup() enforces
one link per pad, and each line exposes only the implicit stream 0 of
a non-streams subdev), so no local refcount is needed. Local and
remote teardown are both attempted unconditionally on disable, on a
best-effort basis: a failure on either side is logged and does not
skip the other side's teardown, since there is no way to roll back a
partially disabled pipeline.

Co-developed-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 119 +++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index da373024c847..31ee3a0d3717 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1996,6 +1996,104 @@ static const struct v4l2_subdev_ops vfe_v4l2_ops = {
 	.pad = &vfe_pad_ops,
 };
 
+/*
+ * vfe_pad_enable_streams - Enable one or more streams on the source pad
+ * @sd: VFE V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to enable
+ *
+ * VFE lines are inherently single-consumer (vfe_link_setup() enforces one
+ * link per pad, and each line exposes only the implicit stream 0 of a
+ * non-streams subdev), so no local refcount is needed here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_pad_enable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct vfe_line *line = v4l2_get_subdevdata(sd);
+	struct vfe_device *vfe = to_vfe(line);
+	struct media_pad *sink_pad = &line->pads[MSM_VFE_PAD_SINK];
+	struct media_pad *remote_pad = media_pad_remote_pad_first(sink_pad);
+	int ret;
+
+	line->output.state = VFE_OUTPUT_RESERVED;
+	ret = vfe->res->hw_ops->vfe_enable(line);
+	if (ret)
+		return ret;
+
+	if (remote_pad) {
+		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						 remote_pad->index, BIT_ULL(0));
+		if (ret) {
+			vfe->res->hw_ops->vfe_disable(line);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * vfe_pad_disable_streams - Disable one or more streams on the source pad
+ * @sd: VFE V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to disable
+ *
+ * Local and remote teardown are both attempted unconditionally on a
+ * best-effort basis, matching the convention used by other streams-API
+ * drivers (e.g. dw-mipi-csi2rx, ds90ub960, cdns-csi2rx): a failure on
+ * either side is logged and does not skip the other side's teardown, since
+ * there is no way to roll back a partially disabled pipeline. If the local
+ * disable also failed, its error takes precedence in the return value.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_pad_disable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct vfe_line *line = v4l2_get_subdevdata(sd);
+	struct vfe_device *vfe = to_vfe(line);
+	struct media_pad *sink_pad = &line->pads[MSM_VFE_PAD_SINK];
+	struct media_pad *remote_pad = media_pad_remote_pad_first(sink_pad);
+	int ret;
+
+	ret = vfe->res->hw_ops->vfe_disable(line);
+
+	if (remote_pad) {
+		struct v4l2_subdev *remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+		int remote_ret;
+
+		remote_ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, BIT_ULL(0));
+		if (remote_ret) {
+			dev_err(vfe->camss->dev,
+				"Failed to disable stream on remote pad: %d\n", remote_ret);
+			if (!ret)
+				ret = remote_ret;
+		}
+	}
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops vfe_streams_pad_ops = {
+	.enum_mbus_code = vfe_enum_mbus_code,
+	.enum_frame_size = vfe_enum_frame_size,
+	.get_fmt = vfe_get_format,
+	.set_fmt = vfe_set_format,
+	.get_selection = vfe_get_selection,
+	.set_selection = vfe_set_selection,
+	.enable_streams = vfe_pad_enable_streams,
+	.disable_streams = vfe_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_ops vfe_streams_v4l2_ops = {
+	.core = &vfe_core_ops,
+	.pad = &vfe_streams_pad_ops,
+};
+
 static const struct v4l2_subdev_internal_ops vfe_v4l2_internal_ops = {
 	.open = vfe_init_formats,
 };
@@ -2067,6 +2165,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 	struct v4l2_subdev *sd;
 	struct media_pad *pads;
 	struct camss_video *video_out;
+	bool streams_api = vfe->camss->res->streams_enable;
 	int ret;
 	int i;
 
@@ -2077,7 +2176,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		pads = vfe->line[i].pads;
 		video_out = &vfe->line[i].video_out;
 
-		v4l2_subdev_init(sd, &vfe_v4l2_ops);
+		v4l2_subdev_init(sd, streams_api ? &vfe_streams_v4l2_ops : &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
 		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 		if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
@@ -2107,10 +2206,18 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 			goto error_init;
 		}
 
+		if (streams_api) {
+			ret = v4l2_subdev_init_finalize(sd);
+			if (ret) {
+				dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+				goto error_reg_subdev;
+			}
+		}
+
 		ret = v4l2_device_register_subdev(v4l2_dev, sd);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register subdev: %d\n", ret);
-			goto error_reg_subdev;
+			goto error_subdev_cleanup;
 		}
 
 		video_out->ops = &vfe->video_ops;
@@ -2154,6 +2261,10 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 error_reg_video:
 	v4l2_device_unregister_subdev(sd);
 
+error_subdev_cleanup:
+	if (streams_api)
+		v4l2_subdev_cleanup(sd);
+
 error_reg_subdev:
 	media_entity_cleanup(&sd->entity);
 
@@ -2164,6 +2275,8 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
+		if (streams_api)
+			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
 
@@ -2187,6 +2300,8 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
+		if (vfe->camss->res->streams_enable)
+			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
 }
-- 
2.34.1


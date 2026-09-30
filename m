Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D234E51C056
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793045; cv=none; b=h7xypTx+trRlHKjexvCqyK2pe1io/dvlKXYhV2xh6Xun5CwK6LPUToDHewrIc9EeboVzGOGZZP39FZfuT3b/wvMG7JctrnHHLZ++Ea7Q2V8pcAc1IolMD9iVuvruipUh+E02jXRdJ5yypnqcNLuh7lm7Yjoq1Rxj86jGXnLSVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793045; c=relaxed/simple;
	bh=DoDb5/3SowuSRtiQ/IVrXUJDL9Gx7dvh6M5JkE/jj7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNno5++9kKEV0R0tL85T4qY6XZAeHYv8s4RGIgoVOS52pQD4YFddX/Q0ILrAlP7ouC3lrzlIa3VWBlFW7Y33uWjgm7OPSomf+bLjEgySH8Dc0++PpDFfQfm38oYIVBnP0KXP4h3ZiikBkQxnM+x6mRGQ8tHJHAZqgwOkwgZ3vbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwDG47sO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yt6wTpOK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwDG47sO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yt6wTpOK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHfGv62902437
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpHX3jtqRYjFgWPpTxd+jJj1azML1VLq4RsQUKEL/Zk=; b=XwDG47sOyyTX4uQE
	xCVZla2iw+H30llwO0qSLg8Vo7Zcl/bEczEsYrtSOTp8JiBiKjHKmlfKHCj3lT1J
	IyxQT9CeqrmfZpk+W6T3LipxJifkR/e2hZ/q9bxPQCzgTk3qBhrAWZ4j65w9ArKZ
	23vryPvinKNGAdN6zsnSyTsJEsKa9lB4schou929Clygs4KuxyB7eC56xTQcoBB/
	JhjyqOWSL4Ps09dgxV3Qzs27KSIJCMDFySjV1DVVvfQ3HFRhrJ26B7MG/iZrAAkz
	7tq6mCCKlMWWrWJ8iuFqRNNKgBhmrtsciot5UvPnOGKFk/YA+Cgbj9zxO3xWuYjV
	a0s9Qw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2y42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:30:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3426f4acfbaso670645eec.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790793042; x=1791397842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpHX3jtqRYjFgWPpTxd+jJj1azML1VLq4RsQUKEL/Zk=;
        b=Yt6wTpOKc7rbPWiGnw38U9KSQ0dY3fx4R0PsfNYBrxMgaZdrm1BDc54zBpRT0xl5fc
         hw4bqdKAvc5VxFWDe6EfqX0PWAQExZtwEftjq4n8o6CVf7HzXpD3mi0o2BKO0RhejKo6
         xdk5rzRGAY0l94+ACAzHAbyCLquKxpMjjL8smSQe9sN1Hah+TjLEEgBGPnxzG7B4TpPF
         IWak9FWKZWuIwluAyiCNOFg+XEsAlvq5wJgSIAVDwPhuy5oeUI9rpRJGNWHTjXwl+/k/
         YGEAlnQnTyX0HQrrnTlD9AZQy2uySfzvSO0BwH4bK8oLY1+B9LH46h871Npx5GeWCMUy
         NjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793042; x=1791397842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpHX3jtqRYjFgWPpTxd+jJj1azML1VLq4RsQUKEL/Zk=;
        b=qJQq3biAIvvEGjJaPLlbEjsX7nMrfW1nXfGxdIbank+jW/EkhpiJfOEa6Es+Yc5bX0
         pQF4yZbFNpeAAULBXZOFPw0FTrIutFu8EWPqO96U5RgtfXK6McbUECA8jnvK3uo5J3EX
         1Z1yaYNvhlh2B3ZTK4aZm5Mon3XexW7vgCl7etJD9/UqkMwWC+S6RW3BPMWL8Xe4exv4
         lH97ThkW+WlpFYWp/y0gcP7D7o60wICvTZhGF6efb3Wl7iff99hEDaDaQamESPqgJ4LO
         HFZdNDqrfA8QH8S//hM1Tn1ZyNsl92epV/Ux9lPr9Vx/yBJnVPqDSvRKtkcUUMhlzAZa
         bDfw==
X-Forwarded-Encrypted: i=1; AKwUvBwbLIvbWp6oXZQFXTnUffXxrAoZflVvWzyfxk4R9DzhZeDjSYk/0A2QQ9cd/DZ+BkmrLAvRZtpLx7DrNwXR@vger.kernel.org
X-Gm-Message-State: AFq9FYL+sP9zkCeFGAP6N8pQDXi/zT4ul2oqq+1JtMNHBdXGfYFMWUcb
	o79m1vPDd/IbF2h3BSS+Y0XvBfrY+a9RF30E31g3f5qSEGgOVfi2JRTV4DK1TnUw7/q+8jRehMu
	FNW/riWVDMr9eK8hzCatWV0no+08vJ/U27Pc2YZLhztzW5pnprG98rIwOf/WxLGBWVBrW
X-Gm-Gg: AYBFou0jgOzoQBiCaQQiu4YtNfcCT9VxBKPS6qs03N3Bg8Zoni3ij26ETS4Dr3Sh9gI
	8irysZICWD02N0ceCkw6EZ9MeM3dlnm6m+pZ6ODvwEcdogB7Oe1jJ6FvlLBvXwmwYpnNCinQWYa
	Jd3Reol1ybJcp8z3P9B675jxSASJQjuU6RZSaXcHCdr1/R5QEMf9LEx/B359nQR3hziERdenMOH
	FwXoo5upMR1DeqhBgIEb0w4ktlXWOqp2L0U+tfMTmOZFhsBaBAjquzY+lcLCJ3FBb4sVDIaSuS3
	42whRRr+NtP8mb0sENPLY9sxrKl5PVfwXmie9mTovhoh9+h6XKshLLBqTHwlz1dBD9nxbbY89/g
	eUE7gfcLXHp1R4TZK0cqbk3XBXfk082PE5PBGqYJgjGBYmqfBdR16HGWrqbON
X-Received: by 2002:a05:693c:2808:b0:34c:3ae5:ebc with SMTP id 5a478bee46e88-34cd60f8956mr4167562eec.0.1790793042013;
        Wed, 30 Sep 2026 11:30:42 -0700 (PDT)
X-Received: by 2002:a05:693c:2808:b0:34c:3ae5:ebc with SMTP id 5a478bee46e88-34cd60f8956mr4167500eec.0.1790793041031;
        Wed, 30 Sep 2026 11:30:41 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db491fae1sm750926eec.24.2026.09.30.11.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:30:40 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:30:24 -0700
Subject: [PATCH v8 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-enc_roi_enable-v8-1-2c908f30e963@oss.qualcomm.com>
References: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
In-Reply-To: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790793030; l=8019;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=DoDb5/3SowuSRtiQ/IVrXUJDL9Gx7dvh6M5JkE/jj7k=;
 b=3o9bVvVxNV8XyKcVyaw5Z6ULOXYLBMOnoDGUjKXcEq4Qq6F0hYv++atAjGTxPljCh5/vPXdwu
 +IdgMCIUU+HBfRBf0NG2khoF0+u/twZsxF5kU8ITfbj0V9sjX5rcV9k
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfX4rVcpULLtDHQ
 6sXIc3kw3EE+JMi65J3iwO8iR/60IxQyBKUhE6vd9ALcBbFotjYj/qH/HcXi3S9gyxsAidNQJ+0
 3CjGxccMzNEuj97pl9pAcvjy0ZO8MG0=
X-Proofpoint-ORIG-GUID: G2RdSZxgvq_1Lzh3hd5XObb2j3xiVW1L
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd5553 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZvH2QzoBumBvrUatZloA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: G2RdSZxgvq_1Lzh3hd5XObb2j3xiVW1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfXxInS3Lwk538d
 6pL7RJIAow0S8tIlZAWNtPKRj7HE/xwuob4rnCHnux/AGeOT6AdBF/eRDCprzHHC4TLtNOFB1d3
 +MYBsG3FDf1d6C+LJ4jP+K3eP92YuTFTxo2i5d619lFMGj561T7UI5oXxsdpcn0FqFml/6s1JC/
 qdAFtLaiKO3DQ2tzRCswMTTbfQxqo/B4v4gfMNBuHjmI0hkNkaXOA6rjeCQ54W3faesadaWyrXD
 l6yrw/4GKaKO3MlFJ9mgJaLo6WHchMoRHQbe59+Euv9LmC/atu7d1uyhtg4Uxf2tGE706MkpDDJ
 NTkC7CZMh8LVzQhYgdogvkrmKv3ZUpxHG9Zopx5iz8IHHTUf0HFhUwf+b+Nj9irJotfGKBcjypA
 LhRmALtta6VZOqu2xtjxi7R0ZDXruhlTnIERuHIY24YLfgW1rfskGICDh6DxbJkps/au0L1Gr9E
 v2O6OxiXF8s3uVDtvqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300075

Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
control type for signed 8-bit values. Add necessary support in
v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
v4l2-ctrls-api.

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/videodev2.h.rst.exceptions   |  1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst         |  6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c                 |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                | 16 ++++++++++++++++
 include/media/v4l2-ctrls.h                               |  2 ++
 include/uapi/linux/videodev2.h                           |  2 ++
 7 files changed, 32 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -188,6 +188,10 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
+    * - __s8 *
+      - ``p_s8``
+      - A pointer to a matrix control of signed 8-bit values. Valid if
+	this control is of type ``V4L2_CTRL_TYPE_S8``.
     * - __s32 *
       - ``p_s32``
       - A pointer to a matrix control of signed 32-bit values. Valid if
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
       - any
       - An unsigned 32-bit valued control ranging from minimum to maximum
 	inclusive. The step value indicates the increment between values.
+    * - ``V4L2_CTRL_TYPE_S8``
+      - any
+      - any
+      - any
+      - A signed 8-bit valued control ranging from minimum to maximum
+	inclusive. The step value indicates the increment between values.
     * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
       - n/a
       - n/a
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
+	case V4L2_CTRL_TYPE_S8:
 		if (ctrl->is_array)
 			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 661a3a25da5220d2e824f71e68871181533e6cd8..c5df0e0a54f81c73975f427957b7c99fd421d5ad 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -297,6 +297,9 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		memset(ptr.p_s8 + from_idx, (u8)value, elems);
+		break;
 	default:
 		for (i = from_idx; i < tot_elems; i++) {
 			switch (which) {
@@ -377,6 +380,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		pr_cont("%d", *ptr.p_s8);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
 		break;
@@ -1442,6 +1448,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
+	case V4L2_CTRL_TYPE_S8:
+		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
@@ -1501,6 +1509,10 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
 		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
 			return 0;
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (ctrl->maximum == S8_MAX && ctrl->minimum == S8_MIN && ctrl->step == 1)
+			return 0;
+		break;
 
 	case V4L2_CTRL_TYPE_BUTTON:
 	case V4L2_CTRL_TYPE_CTRL_CLASS:
@@ -1732,6 +1744,7 @@ int check_range(enum v4l2_ctrl_type type,
 	case V4L2_CTRL_TYPE_U32:
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_INTEGER64:
+	case V4L2_CTRL_TYPE_S8:
 		if (step == 0 || min > max || def < min || def > max)
 			return -ERANGE;
 		return 0;
@@ -2037,6 +2050,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index cec9217d97ac698cd447574f5d079dd913a9ef6f..cbda866197d894657b571ee5d57b4956818b7ee0 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -30,6 +30,7 @@ struct video_device;
  * @p_s32:			Pointer to a 32-bit signed value.
  * @p_s64:			Pointer to a 64-bit signed value.
  * @p_u8:			Pointer to a 8-bit unsigned value.
+ * @p_s8:			Pointer to a 8-bit signed value.
  * @p_u16:			Pointer to a 16-bit unsigned value.
  * @p_u32:			Pointer to a 32-bit unsigned value.
  * @p_char:			Pointer to a string.
@@ -61,6 +62,7 @@ struct video_device;
  * @p_const:			Pointer to a constant compound value.
  */
 union v4l2_ctrl_ptr {
+	s8 *p_s8;
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..ac588d0093df9cc35c11d0b9d41d052d5e800925 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
 		__s64 value64;
 		char __user *string;
 		__u8 __user *p_u8;
+		__s8 __user *p_s8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		__s32 __user *p_s32;
@@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	V4L2_CTRL_TYPE_S8	     = 0x0103,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 

-- 
2.34.1


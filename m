Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218316;
	b=FzxuTnvd1EzoCZ8eH12zFyNWf8T1nrchQ67iVmOXFaEfXCq2F8AN2JMRC9pV3YmguoIr
	 KXqn5DbEIf7KgT8v7Mk9mroMr0DwtYvI/a6k3w4ehJxblrSfyezWVHSTJ7bO8UXvUi+fB
	 wKX11byFHt6+XeI4pkrbDXd8Hvbo36puGUIFYunULHESetaDLdO9HyAsMhTd1wyZwAsvT
	 AOLpBh1Uof1TD+Z20rK5xXxymehIo0r+ypoYpJhWzGK/fmP9/mijDojLIowppcmUHZGj7
	 JnrOZoGcYEWgtLSfLSYk+RsWwPLbxzbhi70RcZxj0uEfusliGzxd11yxWKrWO3Ka+4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OxdmP1ZXt/82Gla2WZmw+ibuDRz0VJj44iHjvcbW1Aw=;
	b=bhxPAV8IM4/TvHJomAaDDwI+Fo7ZEzBbA+lrgB7C0UxkSAgeUxXhl+5zCe9R4kUnRJ4z
	 QADgipubEereFy67M8h4Vd+15n+in4LvzNa4yBRVxFblNmiTpn6WCNZfzNQZIQ3LKaCae
	 ogp5XQVt45Q70+8S5XTtx7m99X2xL4u0V2F27AMfF3qYFxtI+jRHQwsu7vZaNLEGrDYK2
	 paSlUc0icFgVoE9ERADh7xZxeutbROL3XjAoOAaaoumCf1d5W0e8ULfs9iFVS9ZNvRSzZ
	 iknSwIAKF1G5MpOnKCKZRn7Kwmrhqd1TKbhYXRCFvVNCwe0GpSAXFgagE/xWrwwxG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A1ROPQJS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cazP/n5t";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AFE60A2600
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AFE60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A1ROPQJS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cazP/n5t
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKGFwbL3830416
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxdmP1ZXt/82Gla2WZmw+ibuDRz0VJj44iHjvcbW1Aw=; b=A1ROPQJSIT7Yvjvz
	+RbtqweFq9ag4eI+5Q/GEfuyavb2lWTDlHKJs+9dXSfikVGAVQOCFSrkGL1//hbS
	lu8vTeOSa4b4o4g9qf8ohID6scKVHp/6O4+/4xQnZpZL2W3cVQWMUqZRNKSe5o40
	L/dkWCwcdC/gnEbr5/oan+D5W3C0Bo/i5PEpAQUM6ZieM83XdBXh25LZXkrOyQsE
	hQcDKnihu//mqOtJ3a+c6BhZD6VBUVjUzrDiMYJZWIkYFXp1HOA9o/M4mFcBYL+j
	Nz1dAUwRKf0GziiKcbA7I/R9L90OsH6M4paWytJulUIvpGSoaTU/3XI9qM4v4Zr2
	dCXIiA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2sjwhm8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c58d35c0aso222694eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795218307; x=1795823107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxdmP1ZXt/82Gla2WZmw+ibuDRz0VJj44iHjvcbW1Aw=;
        b=cazP/n5tXbLPndwhVLbflUo6ngT7qwM/EsfOlwbDnABEIWePHTxK6pj2stSX9Qn6JL
         X1LRu4I7QYNYdRlT9d2idGuV1HBEUcFsEU6dBKC0/dfFBcZXlBGggVu9ZPPbls+5wtOH
         9otpd60dZbG0lLHmjQ6pfUqODzD7oGfqbc9uHXWflg/m49KpJ7Vcum7yC3kjZ8bzoVZf
         FQNCzPswkalgxhflzqTFIIDyu7J9FWV5E6Et69zvBQ9M+a/SCuRKUT4W1pwSKK1KCnt9
         1JE3aA3CHZVQyn21n0aQIl8e9+mVGVIVn4UBO+XeeNCk5iV2lB1h6NlNo5Z59WqVh62o
         Rcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218307; x=1795823107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxdmP1ZXt/82Gla2WZmw+ibuDRz0VJj44iHjvcbW1Aw=;
        b=eHWASONjV/Ya9K9STch+8OJ2Uj3LcqyHmfzaXVB7l8YU+nv8n0RcrRlDgtx3hzrxpA
         uOJoLL8sWJTipVtFH/B7LvoapZWe5HTXc6WOR9cqhcEqxNY9RD2v9rDQqO4+t3YKy1cZ
         K6Tc/1ADVGj7xVa3SpkjrxK8OctL3Phxkp/tOaQfYpE+LPUty+viC4Wgj3CT6sm83asO
         Ffiznr/PBY/KOvCmKP+z/NnNh3T/6+PpgevML/eP1K5dJlR8nKJZzgId2u3XCb5JRp59
         lXf2o4q+O203VXR6Sx/sp1L+N6K0bTT2V0RtaM1PDmoyxQ01/aaP+JlVOZujQjeWaK7f
         cimw==
X-Forwarded-Encrypted: i=1; AL+hErE21H/xqjOp0cdNju8nNQx/lvRznbuYFLLdCMJYPGpAxiJhhcr1FnNTD1Y8CxGc0K/gvBCI38CTK68NJTFB@vger.kernel.org
X-Gm-Message-State: APuU4Z8T38o9KQ8h5E89xDgeOc8POaW9S/hLovksfHQoYjwQaiaskRZH
	7rDnjlexxivYw1Q0T8ZzrRlZka0bL2puxwZSekIRNfS6EkFiBjrOr0zrxS71v8+bKcYUlywq91c
	wMBGws+/Do6YuOSyU8iaZFKDXSMzElIQL35LOR0S3TsCPS7AKGjVc311a7VGsu4Q2M6yh
X-Gm-Gg: AZFdTZdCHWJXdUWTtZC6T2STKCjbba3h98XGZCrdqq2fAwYcB5eWRSogGnQVHen3cwe
	zGJK7NXThtflC+ZSzpkm6/oQWgtosjclUZDtSvH0EyactZDAJq4PlgjJq1ZBxs+lJM7EM/RR787
	uE08q4CH3WXNaRwy9DOnykC1RicMv5rTT3oStR0McyRywaX3MkLpHtZwIax+QHnKGYcjJbSvRhr
	fbVJA6s4jQbyyMtILesbBN8TmvWwXC48KfFqCHKfwiQ5v4iVMFMmjZnkBn5VDct7X0y+aLIvOgr
	O47NgG3RUbCOlAqKyRJqUI+VQL2cdraEVDsXBsZYk5TXczI2KgfYXJ9OXBb7fs50aOA+tMb6ue4
	y+4oQ4SiW1XqHiuV8USsEu9a6xbyA16e+bwFJp2llwazHRoyApeMhR2ONtkVCEPMVhp+BLl27RZ
	mnyKR2HilMYZcJUdhCFAme4wcDKTG0wVGsEQ==
X-Received: by 2002:a05:7301:b8e:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3856e245b2fmr5568382eec.1.1795218307322;
        Fri, 20 Nov 2026 15:45:07 -0800 (PST)
X-Received: by 2002:a05:7301:b8e:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3856e245b2fmr5568339eec.1.1795218306741;
        Fri, 20 Nov 2026 15:45:06 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14669862eec.4.2026.11.20.15.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:45:06 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:45:02 -0800
Subject: [PATCH v11 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
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
Message-Id: <20261120-enc_roi_enable-v11-1-c00b95ea1b81@oss.qualcomm.com>
References: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
In-Reply-To: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795218304; l=8019;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=3h8pZyNAgbI1LK8jhQfbBWUCKbwZ0GlgMNvlszeKfko=;
 b=CKexUMnttwB579fAWgiv/xx93lRDppNinEY0mUuvuxjc+9Y9XYGBPh+4BeE1uGjLRAmSeETa8
 Cej5sWUBRR5AJ1wCk6IeMzCz/a+PnOkYQcBMOWglpSSsJCW1fwlQ587
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: _csLPi5hM6z-rvhBmnrBYEiFW1X6RnCD
X-Proofpoint-GUID: _csLPi5hM6z-rvhBmnrBYEiFW1X6RnCD
X-Authority-Analysis: v=2.4 cv=dZ4VTnXe c=1 sm=1 tr=0 ts=6b00db84 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZvH2QzoBumBvrUatZloA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX9aRAtnkEHC3g
 F1+E4Fh99/qclkr4G/bxrDMf2FUd2qPOn7gkaJQ0fjaDEg/+LL6Mnd1HndDPTaaJCFWMY0fW3qz
 Oa4y0Dlm/CANgfzmk+S92PLUbMWHxNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX/YP9uor/8xxi
 uGz51mk59hC7BWIoACoxsvbQQ1RFJPgh5aMeNfqYluGnUNE5OISjElS2Dir2sN+xaVRuMPlkk8c
 r9ZKRNAZ+riC2bdQBk4S3Kgan/v+zO/1Ybn2S2AthIgMkbIb9FIXgKTjlC+ZO8aS+Y5bB1inbMz
 r2Nes+FwLUeckO3G8NQqFgXMJSWmbKwNqI70mEIGGnoWSH+uxq/8PTBDfwmpzPOZdtp84lwFb+u
 fRAdg0/FFYjRk4hfTuKUxlETMU6PVUMgMI+p/+Pp5Gg8gKdeIGU2PLT88FMb5rOyeoL6e3Z3Cn1
 J/UtEyXU0BGxvgGdFko/gZpWxKLB0u5kBIeyxvNsxgAXWoOKqby9MGWqvyKa6ebTbuUNJTI+lXj
 ew75sxcfqs5SEoTxM+X51rAPmjPCuiS1c4c3EfbQEE9ckJkN3k5anQQvezVEnbR/X3PRXTLgShs
 BuAsaLuMu3OJPjmHS3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200094

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
index 6e751a043a210618fd7829df16e99e535e9f45cc..a34eb2a21abafe7b0f1e9509939edb9fbedf8030 100644
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
@@ -1474,6 +1480,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
+	case V4L2_CTRL_TYPE_S8:
+		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
@@ -1533,6 +1541,10 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
 		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
 			return 0;
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (ctrl->maximum == S8_MAX && ctrl->minimum == S8_MIN && ctrl->step == 1)
+			return 0;
+		break;
 
 	case V4L2_CTRL_TYPE_BUTTON:
 	case V4L2_CTRL_TYPE_CTRL_CLASS:
@@ -1764,6 +1776,7 @@ int check_range(enum v4l2_ctrl_type type,
 	case V4L2_CTRL_TYPE_U32:
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_INTEGER64:
+	case V4L2_CTRL_TYPE_S8:
 		if (step == 0 || min > max || def < min || def > max)
 			return -ERANGE;
 		return 0;
@@ -2069,6 +2082,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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


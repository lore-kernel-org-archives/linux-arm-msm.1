Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674639;
	b=EZF/SKo1IQrHSOsETqjz5IAZZVfnl5+pUuaJglkYXFQdRxFF1NBagGmaqwheLMeNd/Te
	 o6XIRKL/U9YxP45epny8SSy6Fe7Ggmt05qQxWTryk+yDuIfHg3kZ/ygFlqoim57/DlvKD
	 5GBk2ietSJFkHdlsaTyPspZCjkJIDs/a/UjucucPoRgK/pw1wjQLYR7C2cKNmilybJ50y
	 aO36uRPt82X0xVD9umlZrb5clyS8qkBTAHyQAZQpRvpRUmXAXVoBF0EnrQaLgDWMMnmfc
	 k4sblHdEUA7wXDRwTUlk3IVjhaRsek+De0Nf1VJgK+Hy2frsncMEyfZf+KBtquW26eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x6B/h28xJSfXkwGuEgvXXBf8/I2xBeErshb4xqNBdQU=;
	b=0eeY2wtRbzjrWdroQRUK7Uqy8K/DDLke1/WpH9PVxjeuy+PyEG9l5P+2uMttcK+f+zMc
	 Tjn5NRAdw8L6FCTZoDhU6PX6RIQiHvRPAhMkmKgQIqJBMMz/ZN/icAyNw3zsIgT1oxVvU
	 SKVoIdFurUf6lKWUA3J0VoP+82E8402j/8NpB5HcQaO4Ri95oE8zQRqi64rCDXguaWr+S
	 XrLg1sjI5sHMaEkDBuAKU9PNxTCv4AZigz0QkjB9LIyi3URU39zh5z7PY2PTR1ZMAenmq
	 eOOgbMS/GBqOnv5D0J004WJ8vEsxcDZJbqT4I8Ic1Ts0v4Dot3o1ZkWfSZhHo6gwr/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XALkQJeC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WfvdDexG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2545606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2545606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XALkQJeC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WfvdDexG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36gFc2176288
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6B/h28xJSfXkwGuEgvXXBf8/I2xBeErshb4xqNBdQU=; b=XALkQJeC9Py2oQ9R
	0rmEv5ubdUi9SfaQU7X3MKS3lM1QjwlXWK6hEv4C3u4NQtoQ3BoEgCYnejxzTjSX
	jw5vxb6iM9H+UVE76oYUBd51BklewqKOPU359H/qvn7xSfWerIsEl6QUtYdZ2w6+
	Z8ySoNalkN9CvNZZxMLH0Sso91q3MsckAR1BynOpcDMsBO1BE6UV1kZQ+xKEVEhR
	TAvfvlS/PCR8Da9v6luyoEEK299FLBmy9VvGQchG8Uh0Zr77N7skWqUKAzsoHzcw
	mFFQ9gJv4rA7USbpK0iMf53dTRPbfkBwYwdjOvrr3ImQLj7XRQv2bAHburAach2U
	ExqPRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhvadu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:30:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f045e399acso57887355ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674636; x=1796279436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6B/h28xJSfXkwGuEgvXXBf8/I2xBeErshb4xqNBdQU=;
        b=WfvdDexGu7pHgVuIKVevxaj1rTH7A/HklkVxeBqOs4KZ8NpwKJU9KW24sSYr3PmFKo
         jApjAjpV3q8vfnN81BycNThdAcqffaUSDeEaYD5IvFS96uSMjOX+Vx3Cd4FcTHqgy9Es
         oT7KFOm0P/PxMbxdLVGEkOPue8AY5GNkp3kMAs3ZCvt4RM2HSWvWWyPRVz7+NvHh86JL
         qPV0+i/F3WxKd0PjIq+gj8dtzLji+IsiYYTH1lJdh6cEoQJl3K3xWDb9f7xeUGMMKWxm
         fCDNqLDJotJGl6TtPEDPpXElf1zukfE2+3Hsi5g6FrAWrCCWff9LV8xPY5AmoHSa59d6
         YPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674636; x=1796279436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6B/h28xJSfXkwGuEgvXXBf8/I2xBeErshb4xqNBdQU=;
        b=V/IXnielqOt5xG10GWuSmAsDt9/NEpUjTYsFBReV2xcHdeJxGJo5NVK1BIg+4714Pl
         8PEUl6H8Dtdw6pVCTHiR2ufQNBbjjfvI23PPautqadiZergEXkcQ824VAOvA0bITt7hN
         dld8wmn8tSu0GfygzCjpd1kc6LVvvURRVUOXDrxo+H6NtnJXDezNfBhWGhjn8YjO5G8c
         6yjbBhWS6baWYuwV+CPci7b6vSH7YCSJRaEcALUNsoyEVdgW0jayLbsdSaxXfvsBLiSl
         CGyncas50RXqVJq9jit6luKdS91KJUAGobUpa2hGeSZgE+bNWPS481fVHDOERYdCpEMP
         JIaw==
X-Forwarded-Encrypted: i=1; AL+hErGk7wnnBgoBz/Mqlkjzox01Z3GALmIO4KtyF9OTJwnbHietV7lUe1MeawTTDy8lEcrFeqaciyFoUmu4t0kf@vger.kernel.org
X-Gm-Message-State: APuU4Z9wqSce7BKxP+PZJMqAEinx2/4loDny/rM9ogm0h8ocvEiPm1Nz
	Grt/WcF3LLGMLk6JoiPsAZMnsqZuS8RYLeB6kkMI/j/TmgKK79RxyPs9+e15e2uMYhnZrBXK8vk
	jYFBOI9m5RTrbN3p1OZqOO5OPIBTuI+WktzznL+6I9KFJLGe6R3lO0/nOT8Uy9FPOQ0ll
X-Gm-Gg: AZFdTZemM6hx9fTPjBK6HT5ZwnoYIYW45nXXJwVDk8lDxkZPQPtmhrX0XMb0t5c6P4w
	Nbiahf0qpUhkp6vj0i5nuwTs+fDNj86nIjdvnV0zmv+mYBVSymTjgVm6v1rQrirbIQwCHMYPS27
	m1zBj1632GEtde88eUmVzghwbz7bwaiJYFdrGrb+ULRRrqmq7DtIhjcq6wN0YbbaJ6QsWWpwJOD
	o+jCNepV3REfiDmL8NLUMNDDb2O5QbDNsYRpe8ZW//BvY8xIXGd+nrfflqR5TP5wdQ+o0GRg+TU
	6hE8C3WFQbU0eRMJv83FswfBKYnp17DPGo/NXDVQwvejze4fAp5NcWYz3fgzw24+/XH618Go1r1
	EsFHk76Ho9owL7kFQQJVVFvMpEfmcxTqz3DrsQ4E/5wdNRfSs0Aj3dxN2jKoVO/sFCN2vOxNscQ
	HV/UPHNf0j
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr198948205ad.42.1795674635976;
        Wed, 25 Nov 2026 22:30:35 -0800 (PST)
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr198947695ad.42.1795674635352;
        Wed, 25 Nov 2026 22:30:35 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:30:34 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:16 +0530
Subject: [PATCH v3 08/21] drm/msm/dcp: Add generic HFI display commands
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-8-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=22577;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=EiqxViTycps7miPlq+ivPouhuuE+yzeGDAI1KZR3Xdo=;
 b=XpoPSJ6bI0Oo5bczeRYbYEzrV8gjto1FKaL/2O284JM06fedebNHvVga+qC9xfCv6WdzD2xGp
 UNvBM5rXRlgCg5tsD+3PD0JJ6sAQgPKB454lXUFw6vjZh+rUO0Z979h
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07d20d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=774e4zUhkogwTaAuxCcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 7bP2fkZR6MWlU8AIoPAtgZ-kuji5nw29
X-Proofpoint-ORIG-GUID: 7bP2fkZR6MWlU8AIoPAtgZ-kuji5nw29
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX+q3bO8kwq+fg
 PYnMcAnK/T6MpwLJo4QuGPvoCDU/g3r8I7wKl8fs7AyQb7RBsucIENls2naXZe4gcmnb7UvbJUI
 DjRTNuuQO87i/GmBWrqbnmJKN2fbtDc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXyMkaKvndHffa
 2Y5UlfIp8QXi7mxa/EDMMXUbrwlYCx5nVQ1SE8eFaLuONZ0BglMokLZ3TPWHbLvScp6WKPN6hkP
 +ZWkTUb8Yz30F1yNt9DqEYtGZlOpVa0kQUmHBpG6wT7+e+BjbBmNBgLJxq6r2Xh78XoSFofPx1E
 8MotoNdzEiAmBmG51JMIi3nUVHaaswjqHX3e+i4KuVhqt9t1xeIFk8zKe0/Y1PybVhr99C7VrnL
 kL4573RZkF5XnE/rbs48YyA72cjd4MPMYaFw3QidSz/PV1+p62Se4XoXa6LqZbMuBjKPeQ7TXLh
 LnDZ/bf9okpYGipxB2gPVnY0KREdlssVYivUzr41tAU7V4b4zcn+agDAwZXBAGhFpoogFDGNJcW
 JVWEIJ+XK53kCyKoOzOFzzvvmxJ46okELdQnc/EgZdZSho8iOda5gem+W1KntL48LsuWrmCT3du
 I39O8YT0KXYEHld42qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Translate DRM display state into HFI commands for the firmware-owned
DCP pipeline. Since Linux cannot program the display hardware directly,
KMS operations need command helpers for resources, CRTCs, planes,
bandwidth, and frame sequencing.

Implement generic display command helpers and encode capability,
resource, layer, mixer, bandwidth, frame-trigger, and scan-sequence
state into HFI properties.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile              |   4 +
 drivers/gpu/drm/msm/dcp/dcp_hfi.h         |  31 +++
 drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c    | 191 ++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c |  60 ++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c     | 325 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c   |  63 ++++++
 6 files changed, 674 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 56c48fe2e2c5..08edb1c38a81 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -73,6 +73,10 @@ msm-display-$(CONFIG_DRM_MSM_MDP5) += \
 
 msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_core.o \
+	dcp/dcp_hfi_crtc.o \
+	dcp/dcp_hfi_encoder.o \
+	dcp/dcp_hfi_kms.o \
+	dcp/dcp_hfi_plane.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi.h b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
index 6ea2969e5d89..2b2c92daf18f 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
@@ -209,4 +209,35 @@ int dcp_hfi_send_no_wait_atomic_flags(struct dcp_hfi *hfi, u32 cmd,
 				      enum hfi_cmd_buff_type cmd_type, u32 object_id,
 				      enum hfi_packet_payload_type payload_type,
 				      void *payload, u32 payload_size, u32 tx_flags);
+int dcp_hfi_display_event_register(struct dcp_hfi *hfi, u32 session_id,
+				   u32 event_id);
+int dcp_hfi_display_event_deregister(struct dcp_hfi *hfi, u32 session_id,
+				     u32 event_id);
+int dcp_hfi_display_event_register_async(struct dcp_hfi *hfi, u32 session_id,
+					 u32 event_id);
+int dcp_hfi_display_event_deregister_async(struct dcp_hfi *hfi,
+					   u32 session_id, u32 event_id);
+int dcp_hfi_crtc_set_resource(struct dcp_hfi *hfi, u32 session_id,
+			      u32 lm_idx, u32 width, u32 height,
+			      u32 roi_x, u32 roi_y);
+int dcp_hfi_crtc_set_dest_roi(struct dcp_hfi *hfi, u32 session_id,
+			      u32 x, u32 y, u32 width, u32 height);
+int dcp_hfi_crtc_set_scan_sequence_id(struct dcp_hfi *hfi, u32 session_id,
+				      u32 seq_id);
+int dcp_hfi_crtc_set_power_mode(struct dcp_hfi *hfi, u32 session_id,
+				enum hfi_display_power_mode mode);
+int dcp_hfi_crtc_set_autorefresh(struct dcp_hfi *hfi, u32 session_id,
+				 bool enable, u32 frame_count);
+int dcp_hfi_crtc_set_bw(struct dcp_hfi *hfi, u32 session_id,
+			u64 dram_ib, u64 dram_ab, u64 llcc_ib,
+			u64 llcc_ab, u64 core_clk);
+int dcp_hfi_submit_prop_pkt(struct dcp_hfi *hfi, const void *pkt,
+			    size_t pkt_size);
+int dcp_hfi_plane_disable(struct dcp_hfi *hfi, u32 session_id, u32 pipe_idx);
+int dcp_hfi_display_commit(struct dcp_hfi *hfi, u32 session_id);
+int dcp_hfi_send_device_init(struct dcp_hfi *hfi);
+int dcp_hfi_get_capabilities(struct dcp_hfi *hfi, struct dcp_caps *caps);
+int dcp_hfi_set_display_property(struct dcp_hfi *hfi, u32 session_id,
+				 u32 prop_id, u32 value);
+
 #endif /* __DCP_HFI_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c
new file mode 100644
index 000000000000..c31a0628f4c9
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * HFI commands for display events and CRTC properties.
+ */
+
+#include <linux/device.h>
+
+#include "dcp_hfi_priv.h"
+#include "dcp_hfi.h"
+#include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_commands_display_events.h"
+#include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_defs_display.h"
+#include "hfi/hfi_properties_display.h"
+
+int dcp_hfi_display_event_register(struct dcp_hfi *hfi, u32 session_id,
+				   u32 event_cmd)
+{
+	int ret = dcp_hfi_send_sync(hfi,
+				      HFI_COMMAND_DISPLAY_EVENT_REGISTER,
+				      HFI_CMD_BUFF_DISPLAY, session_id,
+				      HFI_PAYLOAD_U32,
+				      &event_cmd, sizeof(event_cmd),
+				      HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				      HFI_TX_FLAGS_NON_DISCARDABLE,
+				      NULL, 0,
+				      DCP_HFI_TIMEOUT_DISPLAY_MS);
+	return ret;
+}
+
+int dcp_hfi_display_event_deregister(struct dcp_hfi *hfi, u32 session_id,
+				     u32 event_cmd)
+{
+	int ret = dcp_hfi_send_sync(hfi,
+				      HFI_COMMAND_DISPLAY_EVENT_DEREGISTER,
+				      HFI_CMD_BUFF_DISPLAY, session_id,
+				      HFI_PAYLOAD_U32,
+				      &event_cmd, sizeof(event_cmd),
+				      HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				      HFI_TX_FLAGS_NON_DISCARDABLE,
+				      NULL, 0,
+				      DCP_HFI_TIMEOUT_DISPLAY_MS);
+	return ret;
+}
+
+int dcp_hfi_display_event_register_async(struct dcp_hfi *hfi,
+					 u32 session_id, u32 event_cmd)
+{
+	return dcp_hfi_send_no_wait_atomic_flags(hfi,
+			HFI_COMMAND_DISPLAY_EVENT_REGISTER,
+			HFI_CMD_BUFF_DISPLAY, session_id, HFI_PAYLOAD_U32,
+			&event_cmd, sizeof(event_cmd), HFI_TX_FLAGS_NON_DISCARDABLE);
+}
+
+int dcp_hfi_display_event_deregister_async(struct dcp_hfi *hfi,
+					   u32 session_id, u32 event_cmd)
+{
+	return dcp_hfi_send_no_wait_atomic_flags(hfi,
+			HFI_COMMAND_DISPLAY_EVENT_DEREGISTER,
+			HFI_CMD_BUFF_DISPLAY, session_id, HFI_PAYLOAD_U32,
+			&event_cmd, sizeof(event_cmd), HFI_TX_FLAGS_NON_DISCARDABLE);
+}
+
+int dcp_hfi_crtc_set_resource(struct dcp_hfi *hfi, u32 session_id,
+			      u32 lm_idx, u32 width, u32 height,
+			      u32 roi_x, u32 roi_y)
+{
+	u32 payload[7];
+
+	payload[0] = 1;
+	HFI_PACK(&payload[1], HFI_PROPERTY_DISPLAY_SET_RESOURCE_DATA,
+		 HFI_RESOURCE_LM, lm_idx, width, height,
+		 (roi_x << 16) | (roi_y & 0xFFFF));
+
+	return dcp_hfi_send_no_wait_flags(hfi,
+				       HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				       HFI_CMD_BUFF_DISPLAY,
+				       session_id,
+				       HFI_PAYLOAD_U32_ARRAY,
+				       payload, sizeof(payload),
+				       HFI_TX_FLAGS_NON_DISCARDABLE);
+}
+
+int dcp_hfi_crtc_set_dest_roi(struct dcp_hfi *hfi, u32 session_id,
+			      u32 x, u32 y, u32 width, u32 height)
+{
+	u32 payload[9];
+
+	payload[0] = 1;
+	HFI_PACK(&payload[1], HFI_PROPERTY_DISPLAY_DEST_ROI,
+		 session_id, PANEL_ROI, 1, x, y, width, height);
+
+	return dcp_hfi_send_no_wait_flags(hfi,
+				       HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				       HFI_CMD_BUFF_DISPLAY, session_id,
+				       HFI_PAYLOAD_U32_ARRAY, payload,
+				       sizeof(payload), HFI_TX_FLAGS_NON_DISCARDABLE);
+}
+
+int dcp_hfi_crtc_set_scan_sequence_id(struct dcp_hfi *hfi, u32 session_id,
+				      u32 seq_id)
+{
+	u32 payload[3];
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(HFI_PROPERTY_DISPLAY_SCAN_SEQUENCE_ID, 0, 1);
+	payload[2] = seq_id;
+
+	return dcp_hfi_send_no_wait(hfi,
+				      HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				      HFI_CMD_BUFF_DISPLAY,
+				      session_id,
+				      HFI_PAYLOAD_U32_ARRAY,
+				      payload, sizeof(payload));
+}
+
+int dcp_hfi_crtc_set_power_mode(struct dcp_hfi *hfi, u32 session_id,
+				enum hfi_display_power_mode mode)
+{
+	u32 payload[3];
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(HFI_PROPERTY_DISPLAY_POWER_MODE, 0, 1);
+	payload[2] = (u32)mode;
+
+	return dcp_hfi_send_no_wait(hfi,
+				      HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				      HFI_CMD_BUFF_DISPLAY,
+				      session_id,
+				      HFI_PAYLOAD_U32_ARRAY,
+				      payload, sizeof(payload));
+}
+
+int dcp_hfi_crtc_set_autorefresh(struct dcp_hfi *hfi, u32 session_id,
+				 bool enable, u32 frame_count)
+{
+	u32 payload[4];
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(HFI_PROPERTY_DISPLAY_AUTOREFRESH_CFG, 0, 2);
+	payload[2] = enable ? 1 : 0;
+	payload[3] = frame_count;
+
+	return dcp_hfi_send_sync(hfi,
+				 HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				 HFI_CMD_BUFF_DISPLAY,
+				 session_id,
+				 HFI_PAYLOAD_U32_ARRAY,
+				 payload, sizeof(payload),
+				 HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				 HFI_TX_FLAGS_NON_DISCARDABLE,
+				 NULL, 0,
+				 DCP_HFI_TIMEOUT_DISPLAY_MS);
+}
+
+int dcp_hfi_crtc_set_bw(struct dcp_hfi *hfi, u32 session_id,
+			u64 dram_ib, u64 dram_ab,
+			u64 llcc_ib, u64 llcc_ab,
+			u64 core_clk)
+{
+	u32 payload[16];
+	u32 *p = payload;
+
+	*p++ = 5;
+
+#define PACK_U64_PROP(prop_id, val) \
+	do { \
+		typeof(val) __val = (val); \
+		*p++ = HFI_PACK_KEY((prop_id), 0, 2); \
+		*p++ = lower_32_bits(__val); \
+		*p++ = upper_32_bits(__val); \
+	} while (0)
+
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_DRAM_IB,  dram_ib);
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_DRAM_AB,  dram_ab);
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_LLCC_IB,  llcc_ib);
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_LLCC_AB,  llcc_ab);
+	PACK_U64_PROP(HFI_PROPERTY_DISPLAY_CORE_CLK, core_clk);
+
+#undef PACK_U64_PROP
+
+	return dcp_hfi_send_no_wait(hfi,
+				      HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				      HFI_CMD_BUFF_DISPLAY,
+				      session_id,
+				      HFI_PAYLOAD_U32_ARRAY,
+				      payload,
+				      (u32)((p - payload) * sizeof(u32)));
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c
new file mode 100644
index 000000000000..bb75f69b4f3e
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * HFI commands for display commits and encoder properties.
+ */
+
+#include <linux/device.h>
+
+#include "dcp_hfi_priv.h"
+#include "dcp_hfi.h"
+#include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_properties_display.h"
+#include "hfi/hfi_packet.h"
+
+int dcp_hfi_display_commit(struct dcp_hfi *hfi, u32 session_id)
+{
+	u32 commit_flag = HFI_COMMIT;
+	int ret;
+
+	ret = dcp_hfi_send_no_wait(hfi,
+				   HFI_COMMAND_DISPLAY_FRAME_TRIGGER,
+				   HFI_CMD_BUFF_DISPLAY,
+				   session_id,
+				   HFI_PAYLOAD_U32,
+				   &commit_flag, sizeof(commit_flag));
+	if (ret)
+		dev_err(hfi->dev,
+			"HFI FRAME_TRIGGER(COMMIT) submission failed: %d\n", ret);
+
+	return ret;
+}
+
+int dcp_hfi_set_display_property(struct dcp_hfi *hfi, u32 session_id,
+				 u32 prop_id, u32 value)
+{
+	u32 payload[3];
+	int ret;
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(prop_id, 0, 1);
+	payload[2] = value;
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				HFI_CMD_BUFF_DISPLAY,
+				session_id,
+				HFI_PAYLOAD_U32_ARRAY,
+				payload, sizeof(payload),
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_DISPLAY_MS);
+	if (ret)
+		dev_err(hfi->dev,
+			"HFI SET_PROPERTY prop=0x%x failed: %d\n",
+			prop_id, ret);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c
new file mode 100644
index 000000000000..82a7fb420e65
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * HFI commands for device initialization, capability parsing, and resource setup.
+ */
+
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "dcp_hfi.h"
+#include "dcp_hfi_priv.h"
+#include "hfi/hfi_commands_device.h"
+#include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_pack_unpack_common.h"
+#include "hfi/hfi_properties_device.h"
+#include "hfi/hfi_utils.h"
+
+static void dcp_hfi_caps_cache_init(struct dcp_hfi_caps_cache *cache)
+{
+	init_completion(&cache->device_done);
+	init_completion(&cache->display_done);
+}
+
+static void dcp_hfi_caps_cache_start(struct dcp_hfi *hfi)
+{
+	memset(&hfi->caps_cache, 0, sizeof(hfi->caps_cache));
+	dcp_hfi_caps_cache_init(&hfi->caps_cache);
+}
+
+static void dcp_hfi_caps_cache_stop(struct dcp_hfi *hfi)
+{
+	memset(&hfi->caps_cache, 0, sizeof(hfi->caps_cache));
+}
+
+int dcp_hfi_send_device_init(struct dcp_hfi *hfi)
+{
+	int ret;
+
+	mutex_lock(&hfi->caps_cache_lock);
+	dcp_hfi_caps_cache_start(hfi);
+
+	/* Payload and flags follow the HFI device-command definition. */
+	dev_dbg(hfi->dev,
+		"HFI DEVICE_INIT cmd=0x%x flags=0x%x timeout=%ums\n",
+		HFI_COMMAND_DEVICE_INIT,
+		HFI_TX_FLAGS_RESPONSE_REQUIRED | HFI_TX_FLAGS_NON_DISCARDABLE,
+		DCP_HFI_TIMEOUT_INIT_MS);
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DEVICE_INIT,
+				HFI_CMD_BUFF_DEVICE, 0,
+				HFI_PAYLOAD_NONE, NULL, 0,
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_INIT_MS);
+	if (ret) {
+		dev_err(hfi->dev, "HFI DEVICE_INIT failed: %d\n", ret);
+		dcp_hfi_caps_cache_stop(hfi);
+	} else {
+		dev_dbg(hfi->dev, "HFI DEVICE_INIT succeeded\n");
+	}
+
+	mutex_unlock(&hfi->caps_cache_lock);
+	return ret;
+}
+
+static void dcp_hfi_parse_init_caps_kv(struct dcp_caps *caps,
+				       u32 prop_key,
+				       const u32 *payload,
+				       u32 max_words)
+{
+	u32 prop_id = HFI_PROP_ID(prop_key);
+	u32 count, i;
+
+	if (!payload || !max_words)
+		return;
+
+	switch (prop_id) {
+	case HFI_PROPERTY_DEVICE_INIT_DCP_HW_VERSION:
+		caps->dcp_hw_rev = payload[0];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_MDSS_HW_VERSION:
+		caps->hw_rev = payload[0];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_DCP_FW_VERSION:
+		caps->fw_rev = payload[0];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_VIG_INDICES:
+		if (max_words < 1)
+			break;
+		count = payload[0];
+		if (count > max_words - 1)
+			count = max_words - 1;
+		caps->num_vig_pipes = 0;
+		caps->virt_vig_count = 0;
+		for (i = 0; i < count; i++) {
+			u32 idx = payload[1 + i];
+
+			if (DCP_REC_ID(idx) == 0) {
+				if (caps->num_vig_pipes < DCP_MAX_SSPP_COUNT)
+					caps->vig_pipe_ids[caps->num_vig_pipes++] = idx;
+			} else {
+				if (caps->virt_vig_count < DCP_MAX_SSPP_COUNT)
+					caps->vig_r1_indices[caps->virt_vig_count++] = idx;
+			}
+		}
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_DMA_INDICES:
+		if (max_words < 1)
+			break;
+		count = payload[0];
+		if (count > max_words - 1)
+			count = max_words - 1;
+		caps->num_dma_pipes = 0;
+		caps->virt_dma_count = 0;
+		for (i = 0; i < count; i++) {
+			u32 idx = payload[1 + i];
+
+			if (DCP_REC_ID(idx) == 0) {
+				if (caps->num_dma_pipes < DCP_MAX_SSPP_COUNT)
+					caps->dma_pipe_ids[caps->num_dma_pipes++] = idx;
+			} else {
+				if (caps->virt_dma_count < DCP_MAX_SSPP_COUNT)
+					caps->dma_r1_indices[caps->virt_dma_count++] = idx;
+			}
+		}
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_MAX_DISPLAY_COUNT:
+		caps->num_displays = payload[0];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_DSI_INDICES:
+		if (max_words < 1)
+			break;
+		count = min_t(u32, payload[0], DCP_MAX_BLOCKS);
+		if (count > max_words - 1)
+			count = max_words - 1;
+		caps->dsi_count = count;
+		for (i = 0; i < count; i++)
+			caps->dsi_indices[i] = payload[1 + i];
+		break;
+	case HFI_PROPERTY_DEVICE_INIT_MAX_DSI_RESOLUTION:
+		{
+			u32 w = (payload[0] >> 16) & 0xFFFF;
+			u32 h = payload[0] & 0xFFFF;
+
+			if (w > caps->max_width)
+				caps->max_width  = w;
+			if (h > caps->max_height)
+				caps->max_height = h;
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static void dcp_hfi_log_pipe_ids(struct device *dev, const char *label,
+				 const u32 *ids, u32 count)
+{
+	char buf[128];
+	int pos = 0;
+	u32 i;
+
+	for (i = 0; i < count && pos < (int)sizeof(buf) - 8; i++)
+		pos += scnprintf(buf + pos, sizeof(buf) - pos,
+				  "%s0x%x", i ? "," : "", ids[i]);
+
+	dev_dbg(dev, "%s: count=%u ids=[%s]\n", label, count, buf);
+}
+
+static int dcp_hfi_parse_kv_buf(struct dcp_hfi *hfi, struct dcp_caps *caps,
+				const u8 *buf, u32 buf_len)
+{
+	struct hfi_util_kv_parser kv_parser;
+	u32 prop_key, *prop_payload, max_words, last_read;
+	int ret;
+
+	ret = hfi_util_kv_parser_init(&kv_parser, buf_len, (u32 *)buf);
+	if (ret) {
+		dev_err(hfi->dev, "KV parser init failed: %d\n", ret);
+		return ret;
+	}
+
+	last_read = 0;
+	ret = hfi_util_kv_parser_get_next(&kv_parser, last_read,
+					  &prop_key, &prop_payload, &max_words);
+	while (!ret && prop_key) {
+		dcp_hfi_parse_init_caps_kv(caps, prop_key,
+					   prop_payload, max_words);
+		last_read = HFI_PROP_SZ(prop_key) ?: max_words;
+		ret = hfi_util_kv_parser_get_next(&kv_parser, last_read,
+						  &prop_key, &prop_payload,
+						  &max_words);
+	}
+	return ret;
+}
+
+int dcp_hfi_get_capabilities(struct dcp_hfi *hfi, struct dcp_caps *caps)
+{
+	struct dcp_hfi_caps_cache *cache;
+	int ret = 0, opt_ret;
+
+	memset(caps, 0, sizeof(*caps));
+
+	mutex_lock(&hfi->caps_cache_lock);
+	cache = &hfi->caps_cache;
+
+	if (!wait_for_completion_timeout(&cache->device_done,
+					 msecs_to_jiffies(DCP_HFI_TIMEOUT_CAPS_MS))) {
+		dev_err(hfi->dev,
+			"DEVICE_INIT_DEVICE_CAPS timeout after %ums\n",
+			DCP_HFI_TIMEOUT_CAPS_MS);
+		ret = -ETIMEDOUT;
+		goto out_free_cache;
+	}
+
+	if (!cache->device_len) {
+		dev_err(hfi->dev, "DEVICE_INIT_DEVICE_CAPS: empty payload\n");
+		ret = -ENODATA;
+		goto out_free_cache;
+	}
+
+	ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->device_buf,
+				   cache->device_len);
+	if (ret)
+		goto out_free_cache;
+
+	if (!wait_for_completion_timeout(&cache->display_done,
+					 msecs_to_jiffies(DCP_HFI_TIMEOUT_CAPS_MS))) {
+		dev_warn(hfi->dev,
+			 "DEVICE_INIT_DISPLAY_CAPS not received\n");
+	} else if (cache->display_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->display_buf,
+					       cache->display_len);
+		if (opt_ret) {
+			dev_warn(hfi->dev,
+				 "DISPLAY_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		}
+	}
+	if (cache->vig_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->vig_buf,
+					       cache->vig_len);
+		if (opt_ret)
+			dev_warn(hfi->dev,
+				 "VIG_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		else
+			dcp_hfi_log_pipe_ids(hfi->dev, "VIG_CAPS",
+					     caps->vig_pipe_ids,
+					     caps->num_vig_pipes);
+	}
+
+	if (cache->dma_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->dma_buf,
+					       cache->dma_len);
+		if (opt_ret)
+			dev_warn(hfi->dev,
+				 "DMA_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		else
+			dcp_hfi_log_pipe_ids(hfi->dev, "DMA_CAPS",
+					     caps->dma_pipe_ids,
+					     caps->num_dma_pipes);
+	}
+
+	if (cache->vig_r1_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->vig_r1_buf,
+					       cache->vig_r1_len);
+		if (opt_ret)
+			dev_warn(hfi->dev,
+				 "VIG_R1_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		else
+			dcp_hfi_log_pipe_ids(hfi->dev, "VIG_R1_CAPS",
+					     caps->vig_r1_indices,
+					     caps->virt_vig_count);
+	}
+
+	if (cache->dma_r1_len > 0) {
+		opt_ret = dcp_hfi_parse_kv_buf(hfi, caps, cache->dma_r1_buf,
+					       cache->dma_r1_len);
+		if (opt_ret)
+			dev_warn(hfi->dev,
+				 "DMA_R1_CAPS parse failed: %d (non-fatal)\n",
+				 opt_ret);
+		else
+			dcp_hfi_log_pipe_ids(hfi->dev, "DMA_R1_CAPS",
+					     caps->dma_r1_indices,
+					     caps->virt_dma_count);
+	}
+	caps->max_planes = caps->num_vig_pipes + caps->num_dma_pipes;
+	if (!caps->num_displays) {
+		dev_err(hfi->dev, "invalid DCP caps: zero display count\n");
+		ret = -EINVAL;
+		goto out_free_cache;
+	}
+
+	if (!caps->max_width || !caps->max_height) {
+		dev_err(hfi->dev, "invalid DCP caps: max resolution %ux%u\n",
+			caps->max_width, caps->max_height);
+		ret = -EINVAL;
+		goto out_free_cache;
+	}
+
+	if (!caps->max_planes) {
+		dev_err(hfi->dev, "invalid DCP caps: no scanout pipes\n");
+		ret = -EINVAL;
+		goto out_free_cache;
+	}
+
+	dev_dbg(hfi->dev,
+		"DCP caps: fw=0x%x hw=0x%x dcp=0x%x disp=%u max=%ux%u vig=%u dma=%u\n",
+		caps->fw_rev, caps->hw_rev, caps->dcp_hw_rev,
+		caps->num_displays, caps->max_width, caps->max_height,
+		caps->num_vig_pipes, caps->num_dma_pipes);
+
+out_free_cache:
+	dcp_hfi_caps_cache_stop(hfi);
+	mutex_unlock(&hfi->caps_cache_lock);
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c
new file mode 100644
index 000000000000..960628ccd98e
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * HFI commands for plane properties and layer detach.
+ */
+
+#include <linux/device.h>
+
+#include "dcp_hfi.h"
+#include "dcp_hfi_priv.h"
+
+int dcp_hfi_submit_prop_pkt(struct dcp_hfi *hfi,
+			    const void *pkt, size_t pkt_size)
+{
+	struct dcp_hfi_buf *buf;
+
+	if (!hfi || !pkt || !pkt_size)
+		return -EINVAL;
+
+	buf = dcp_hfi_buf_alloc(hfi);
+	if (!buf) {
+		dev_err(hfi->dev, "HFI prop pkt: TX buffer pool exhausted\n");
+		return -ENOMEM;
+	}
+
+	if (pkt_size > DCP_HFI_BUF_SIZE) {
+		dev_err(hfi->dev, "HFI prop pkt too large: %zu > %d\n",
+			pkt_size, DCP_HFI_BUF_SIZE);
+		dcp_hfi_buf_free(hfi, buf);
+		return -EINVAL;
+	}
+
+	memcpy(buf->data, pkt, pkt_size);
+
+	return dcp_hfi_send_cmd_async(hfi, buf, pkt_size, NULL);
+}
+
+int dcp_hfi_plane_disable(struct dcp_hfi *hfi, u32 session_id, u32 pipe_idx)
+{
+	u32 payload[3];
+	int ret;
+
+	payload[0] = 1;
+	payload[1] = HFI_PACK_KEY(HFI_PROPERTY_DISPLAY_DETACH_LAYER, 0, 1);
+	payload[2] = pipe_idx;
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DISPLAY_SET_PROPERTY,
+				HFI_CMD_BUFF_DISPLAY,
+				session_id,
+				HFI_PAYLOAD_U32_ARRAY,
+				payload, sizeof(payload),
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_DISPLAY_MS);
+	if (ret)
+		dev_warn(hfi->dev,
+			 "HFI DETACH_LAYER pipe=%u failed: %d\n",
+			 pipe_idx, ret);
+	return ret;
+}

-- 
2.43.0


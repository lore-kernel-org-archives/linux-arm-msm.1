Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802154;
	b=G5kbYWy1J8y0WAFwqOEdmLECIqY0Krpkxqr8LusBFaoG12xdiRWEdIJQIdu/UNipg+l2
	 zRSk9oXvAPyeokYZ6JJVlGXHYuwTl6P1XoZVeF+MQU12rKT25uzRyPLctiCtHKk2rVZpl
	 oZ+X05X2zyG+hOhNYLC5S7+oi5RL/5CekOBfSHXvpGuan1OuHUTdnZE+EAxRtAjWMB2jo
	 KGI0yNwHD9VD5NsO2UnrDu1doqgZViFrHGzgk8wxOIjiu2CYDxOhyoBfBp3Heowa/+Xyh
	 j0jzYj+aQfn/cToRNh1xY9CCWX3z2r2yksnMwmZywy8fNHVi8lJrg6pqjc0gkO18OCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
	b=aqaAI4SRmwErCGpF0WCAVTx4aBt4JEW3L3LUM9Li3KFaR+22ehvkx4CGU2s4LTxBxHTu
	 PJeTAfLt2B7BE7GJiRuXpLyzEVGxq0u6gISl1fmV3GbU5BxamWxoXwPmR2dtlv2l122k6
	 pUhSUNBna0RZ4FrC7p+yzFyP90zOQAVERNjfT8ek3zVYuyPEusmKyR1HOf3MqOM0ZsYBk
	 jgU1lNQQoV58ocNFJPgaAJLNSwGjwYMPnd9r0vsqNu2nugZL2Z1VUeiX7s1BSehsXj0Lg
	 jL0iLnWI6Z3m/6v41Dq/5DAgTXrOj3khBxnXFFmHyG7Iaiwbi4tsSfGcylsracsPrLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSvT0cdV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB6PpQTB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A888D606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A888D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSvT0cdV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB6PpQTB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvUe53684536
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=; b=iSvT0cdVgJ0EsrL3
	VeUXDYlR1oe5zbT2nm0wBC4FnO8cxqsNKwrwDhJmAvn9i5lSih2nc5iErX0a+Gtq
	roodXLvWOdppJmPElzGeOnCQjpDETl5gVeLhlfLW6qTCKqh7FYr6Un9Ie4R6i1en
	ls/82xYkae/pNdhQ08MGuYtbltS9LJFdjhEqtuCte+ZEKzudj1kxIWYc54coJZyL
	Z76e/G6Kw/js6zM/zMJplDPRmv2FwKk1DAt+Mo/E5NoN7jKYVgNkBSBsmpL9q8fq
	Bs7VnL+R9stFWJhrI1Wa/UP95RCplurVhAX07Iu+ZwjBfLUvaemJpEA6LyttJ7En
	Yr0Txw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sg5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:35:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so147193485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802152; x=1793406952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
        b=GB6PpQTBgTljpf8xobj+MJt3SHKMOjojoRJx/QVyTk8k1XpSty4EpNxxdaSTYF5Qiz
         M0gjvquNI1XztnguoLB6i3rR9X6/8l8w3w8t/ceZ5Dau5BC1FFqnJxFcLDJsGLWryaT0
         7M1mDGy+lHyxjxCe3HAElFd9qFjFpX7alWfTKOfRRzgtFSvqMiYMnrd8CJkch6V8ZFBC
         tk/PzqGGMbhFUn5F/rq/80bFdOknGuKqBZFLkCFx5zr31y6JP6uDsAX/J8zixNWu7pE/
         U+osYOMHPE24RRwwRBIT8/emdsT0DNrts6bGj/46b5UirxvYhG8WLHwTjqKvI4S/jvJU
         MCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802152; x=1793406952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MqBEm9GcwXWuV98ckY8EXxagMIV0AXE/oG5ttG6PlU=;
        b=uBnGayDBqE+3t5f6Oh8YcClxh3cUXXYXt5n+CidEG+M5A8g6rySZKgagdZW3yeI4sG
         f5Cfno4YXWuaER0BR3r46cxicGCTOg0VsKeV+n4ccToKPA8Vv/D9Xx/Ydn58Bc5RGSIC
         roF1zlJVkpWy33vrDsSzPwn8RJpfIKvLk5vRzWl/fOQFmRiz0Fcn1CtDZ2cBUz//NOp4
         zXKGq/GZXgOSxww2MsZK2Wr+0v3pntDlFryaEYs0iX8u8IgQTQypGRtsv1gLO9uflox9
         IsYBXnebfNg1/zC2hIveK/I11tL04t2jb1kkpPuqZhiEuCYBEGBvDEcJ447gJQjRpVyD
         y8iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj/+UTbxZ1Y7+LFpb1zGMHB1qEgc5vDp/qkdNgxaPGCPYcmTt1smNsNd3WhShhH10NilTG8zvVnqdSLI7U@vger.kernel.org
X-Gm-Message-State: AFq9FYICobU6s/lkjT3wE3ZLmhDh8SSjk7a2kwZVu4PQfjca5uXQNGtg
	PQUpE8V0KG6UpHqf2PC3PYSdBwGp4saJp1LrbUGIkE7ywp7LRfeliEZR4m5EYUfxgEjcE3gAru1
	YBQczhFFueQI8Ue8N9KSb4LELBKEp820aU5huG2NDyi3x8wGK5MDNSHTQE0pqocTihNdt
X-Gm-Gg: AYBFou27tkNrNot23xxTd8hmVjap0g1W2HZuJNmkD8fxG6twBFNajtWrh+Gv9ETDB7u
	K+j82+sC2oajljntN/xujv+Gye27/u18Swv/naWa0NXcE7iRrYxSQaR9oWlODyoAa1Agaug2MzC
	xEGIf6yMBjwkmL4OTlcDWlZnWzYmAV3qAItmztlBfd5C0IYV5JZlLpQ9piiS9pjvEyADm2Cpchz
	1rxQ6N03rHRaTw4u2Yqz9sGtkUqjGWNhZfi2C5idbIq83d8+itjawMCPPiw9zJV4LDTvMRRBJpu
	Dh5+T1eyNe9SfRzyM7T6mJVVgKChfrtUDhBO0fLsVwuTkeageaICp8AU9YCs1cJRuw0fdUu4ODC
	SwPbiU+oeJGjeBrgMxcOsMl/+m6aG23PM3eOLTCwNhkAONMXhmMI+BVlTSn+nYdeH6ySk8Ot/uc
	p6rmKnh2SdgKZV
X-Received: by 2002:a05:620a:31a1:b0:93e:7ddb:5098 with SMTP id af79cd13be357-940ef914055mr112223085a.25.1792802151657;
        Fri, 23 Oct 2026 17:35:51 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93e:7ddb:5098 with SMTP id af79cd13be357-940ef914055mr112220485a.25.1792802151133;
        Fri, 23 Oct 2026 17:35:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:19 +0300
Subject: [PATCH v8 3/9] drm/bridge: pass down IRQ_HPD to the drivers
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
Message-Id: <20261024-hpd-irq-events-v8-3-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cbl9yZWv2wcwZMEJm5DgazWObDlawl+w/YpgLor6f/M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Q5qq94RDFJmqbrbH7//o5wMxn1txHfn78s
 w49BIQASi2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UAAKCRCLPIo+Aiko
 1YYQB/4gOy8ZDd8HxSiS0ermuGBCe/hOc4/eCJhGWEwmzSzxuGvDIciQZHmqatS3ReVi/3StJvU
 dENoSV2zGwvHZbVEK9yPEFib63ePlwc1i7cPZX6HPCVQrHd6Rvt1g3wi93xkccFMUAB/UVKqRue
 F+JA0xVmUayRO2ZgrXX19jyiXe4PvtTcRqKj39KHj/eiPb5tSnL7HvlFBeX0X53be9aycR81pt7
 MR9fdS8Pw5smA9t3HMU14UDhj3PAWAH9VrtqZ2vBYeoDM+EewOEhEpgSnop27oIv+UXDHEaY5R1
 RHAazD8SmCrw7qew6GgxaS9/2xv7WvNkSnfWeWfwgp3Wc/xu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXxBQPHTzF/c57
 E7TMl+umumZXgtdEBQDNC3gio4UbKXGyXyPyvsvoP4vPiyGykolNSXNs6w4bRWjuDan8ci5hysi
 OdbZqO0lKpdZte8oT64Y98w4aujfnWBXayNarzSkIPgGJu7H1qjqkWzKPJYQZHxY6iZmkHLwARj
 irTQW4Ozt6Mw5e2G0W196ZK2uiqrrbdHc1kWSp+JhmTPeMAzoJdZ1P0nA/tf7CClgc19fXZ1dl4
 UvNbICtyEuGTvTRvIQm/xh0yD9oX7ZHX7muC/eZOhRTmsGHi8DPaMDZ87/5iy/Pcinw4lK+8D1m
 gAsFMtuTOK94VldmrmKbFF7edY1k5zrLAxGT32+CJN+e5xOtSEy+YarxCYPiGjP1WSo7q4GA/nm
 2BMfsY02/ZLxsQn0DQnSzUG0LJTQtDzUnNrP2H3olqP7mf0tuWIbZkq5OONht17bUI1hYSsvUGS
 K6+ZRb60zh8Oda3QonA==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbfd68 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: XUSlrjh-WlUINm45e3FXBC6ARz_AuI-Q
X-Proofpoint-ORIG-GUID: XUSlrjh-WlUINm45e3FXBC6ARz_AuI-Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX2dr6d1nN7yeh
 pMrGNWV0GrDTem7hjg1YRiEiNZTq2UNCP/Xuj0cfXYOZ/dLYCzzb+TF1Vzi2uFCczFZ+hGFWOU6
 oaKIZ/bqog/Er+6pUrA/KJB/P96aobU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 8 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 898273f60cf6..1b0a1a00d8eb 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -151,7 +151,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6abe30bdff12..fa8942922b53 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1541,7 +1541,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index bd6c4d2dcdc8..72972a6fe989 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index c542ba6ce7d3..a21f9355594c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..6382ef5f1ea2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3


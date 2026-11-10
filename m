Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286573;
	b=dNgI3lVj/mnOxGYPUky6g1CnE6neFR9NxDcmTfzIfaE5k+huHoqUqKl5aodQOTnp2ZLp
	 JYPNvpbEDDEhM14eLMzNlWO8AmdVvlvHoUsyz6H03vePvkoofxo2jzmPHx4Drdvf/0Rng
	 kf7Hzc43wtEKALZLgqNajWxbogLzk0BRGYmsb5T8zWqkoMuSomhDe/RU3EdKW1fq2nZu/
	 XzV3ykfHgvfrlhS14pV+Tj8Ou2McR5UuOV6g24f2gax8+UBjUdSFra0u3F3EZAiHrj6yV
	 6n8pukfZS1KgRVbguSLVSvbz+OM0v5BgSFB5MbRbWrmKyzIIlLh3+D+EzF4F1Bu5yrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
	b=E1I9/7WBi0NOOf/kU9vsuWFuhsT8hcgVnwkxvve6iF5kPNKBxZxXvXL7UUNmP8fhVAPY
	 O8pGpHb9US25bC6SYOCAZN0ktTJDc+3GIRvPuNz9eT4/+NHNER0fGrS/41dGp0L2FdQxD
	 O9rQYpail6WGqA0qK5VN0zwk2GYsJ8+PbWdZDwmjW2WWlfhvZ9P/3jhiaQ6fJY8wgA6ei
	 zBl+WwGJvDevcOAHLTvZJNHXuBXl9kDSU/ELvrXbwHFUDZp/u9i3amUsL/i5FVmM3jfgP
	 wwg5Em0DmHUxn7QExdgwMWPOxN314f0vLSjE7kHGUtbE4p2iX80K+RrveRAyDOd8grA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnpTLoy4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZCjEJs4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD260A3817
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67FD260A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnpTLoy4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZCjEJs4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49wfx2297606
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=; b=AnpTLoy4Rf8Kph2/
	VnpjvANelHxxBsn7Potl1+Mix4C5oNNt3kbNPtDHyRGLuQuFC6xunwkPdI/X0sQ5
	AoeUY+/NONARe43Uebg2Q4BTAC4FB1kvHWqZrl9TwNHo3ATpogr8gZWkJ62Qe2FL
	xoNeYVtCu8mzi63tpECYKWxUV9CHmNJI9ArIfVL6VEF7/R8G9XiJcTgkkOs9Z1YL
	JOlVzmcNu6jL7Aq92Y1vcmOAY2+vXF4pfRv3uoYgATApct6+shLsC/Kt0ItGnhZF
	LOIGJMF0DlMDAZqzNhoI+s9DTj6Yc+mI/2BcgO2BvFgd5kHjksrCMWKqgZ6a+5cN
	yA9g1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2n0k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94607500fb0so284067285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286572; x=1794891372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
        b=GZCjEJs4wdbfSlo18ot+Y9iSo/FN3cI3jk+Ow+eOtQxor4tmBDfnYt1etW3DwC8q1P
         1QdF3poeP5dJ+AlJJkuW4Cmr9HODji8jMrluqvn/p4ON4NWn7CI3UX8As68m2v43OchW
         b9GaLPK9JyGQAQxuzdL2+cV5QkzUmsKzdKe3KAK90dhaEv7Ze3uTMmFftHA2QfZ9Mabu
         wSvziAfH6ZYmJG0r6BFnAfVIzWRermX+ev1X7f5IJ6Lz6Gs2HxYPEcStTKDm8NFNdasr
         liMmnMHfzAbhq79i0eLLFRf7HK9uGvONjMI59AlZhPyDtXkTKS7Sbw2HYtbwoTkIBbeN
         fBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286572; x=1794891372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
        b=g+n+/G5kdCtE5BWKuDd6IzncQAevFf4ICc8rJdif4Y23AKxfwCLJRZs7hSIpywN04x
         xY7gXowl6B9MdMsayI9k6EZCEg6xRIsBhelzdd0SoE8oQOdSHG+nBYZbEHAgOyobZ3CN
         FWRhZOSaOGQjj4mKkuenKTq5aNNIJubt7ItXjKe3OP4YAXYyMbs9JyR5vtI8IpPfrNBe
         tbb6N5dYbZ5nd0oS0NLO9YvlgK2ASUuGOcyaPhvRpQbR6Sof7inSH0woiVGiCOyW5Mdi
         oEtT/PArxAvAUq7NN+EQYmwHqdwhJpxfN7vuf8WgQPBIJSlNuwURIEWCTSLRGOJe7xgh
         Gfgg==
X-Gm-Message-State: APuU4Z/W4UaMcaElQtaFZIIaV5xknPi/7qZcBtQvmv33Tlp6rfkfxjdg
	VjtEtC5hB0MUsu66/bay8t6EGDkFK/8v4T4HdPs0y41nbiTxkq7Fzj1ilJ5ZWq2dRMhl9FJfpeG
	QfXarIUvmD5ezoO7N9pCp8pehRW5r5pgiG3gQo+qbqxp/6LdtTVtRGSfsHM7m0GrITPMt
X-Gm-Gg: AYBFou0asnvPd3vpCzddNSFY9N6euOqupNBz1R651s8+1CYUcM/BSzJ2hWJR0QS7Kuh
	etu1YP/8BB4isE2Nk5sk4e+0tezBjpPRs+Xy5y3rWPtyN8TpKngg3Jdc+uoh3V4JhIzxH1k3jvw
	alyYfwmaXFqACsnj84dxhaN4DJsE3G19EYAqt3baNQaf29RB5CpeKgC1QWatQfsS/iPJJAqWcB+
	Rb6xSIVAPHiDTdEfUqWNwY/m7hSrlNEl1veLfdZJPYLZv/djOMEbBjcbZWmlVqVOYXbwbuG8ds7
	W6wPEpF9XkJt+/0bBQ0l/HPF/AxUH0DTtbvDTEWOzMxZj/iyxLnNoChAQh2Khqyl7CA0fwO2+hU
	9SUD0q3BDOXiCHGxcMxJTgxw6QnTpCD/GD+oNEcQ3gRVS0GSS/hbWaPmzuTf3V6eLHNQ+8ejWjR
	DLOOKl87Rs31B35imcRpjC+rVMtvmY82OYD1Xf
X-Received: by 2002:a05:620a:3193:b0:945:d7a2:4b58 with SMTP id af79cd13be357-9479f343931mr274929285a.65.1794286571732;
        Mon, 09 Nov 2026 20:56:11 -0800 (PST)
X-Received: by 2002:a05:620a:3193:b0:945:d7a2:4b58 with SMTP id af79cd13be357-9479f343931mr274927485a.65.1794286571307;
        Mon, 09 Nov 2026 20:56:11 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:11 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:41 +0800
Subject: [PATCH v8 20/29] drm/bridge_connector: avoid detect-based HPD
 notifications for DisplayPort
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
Message-Id: <20261110-msm-dp-mst-v8-20-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1626;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0BzSJVy5hCHAkX2oiDIpRZW7mGbTKWmnfn6hw/d2uWg=;
 b=ar5hEtLcpwfPsJS8Yu2/xs75nWEgCc2nuCkoqEuJP7Hc/pXZdA5U9VXgPqcrHXwaWSL9ardjj
 9kEnuf+m6TAAAYlUhsTcmA2UpeKQ3GjnMpD6TGfK1pJk1KZu0HEJTeW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af2a3ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=c5AeteMbgwRpADRefSEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX5ARqakrNMf5C
 QYOdculQYujMyPcdyiUvAOqZRo6rhLoOx3h9geEw4KL5U9OBtU8LEKQPDdr3qigRPkQ6yPCejFV
 isVMhjhClWIsIy4Ti8vN3Kq+lAo+v0kDY1FCNySyL4zkd809l11FFhAAujV24AIm5mtbgUX76ni
 eCCOju1Gi4U/Q4VyLS53IKAPPYYZIZzldV0S779gKQdZ7vMKI55or1Tt3SkSCZnY4m1ZrhvGXGH
 A7PI0nZxmkKuJ1eJbl2NawSTshWc1Rwesv9782prsXra/ni1d9Nx7PXKiLXH5UDwvX+iydhNQHR
 kuvD39Mtx6saIHZXO99RSTjYMADnOJ2EiEzkM/kglBMjg/JofK075ZrNP/XEJJQTOU2wzVlyXGc
 Enpm2pHHycbJw/JyEySaXuTJUPjO9lziXxe01IJAZYUhL99nYEhS3cu29P7If5+QgPeI7wlI/+h
 t18+0xz9iy7DNE98gfA==
X-Proofpoint-GUID: Zpf4c_tm4LxFsWzqDy_6QhGXyN8Z6e4Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX/uzVXducZSCe
 UHm+rgPcrlLN2PAPTApHi7/di+MZPB4CSzZGKljspCaVKywYp0oJNGaqnMufYVI4Mjzp/dg6YuD
 ORfVncBCqs41bifCEaREvtbhc0evcE0=
X-Proofpoint-ORIG-GUID: Zpf4c_tm4LxFsWzqDy_6QhGXyN8Z6e4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

When MST is active, the SST connector reports disconnected even though
the physical DP link is still connected. drm_bridge_connector_detect()
forwards this result to the bridge chain as an HPD notification.

On MSM DP, this notification invokes unplug handling and tears down the
active link and MST topology while the cable is still plugged in.

For DisplayPort connectors with an HPD source, stop notifying the bridge
chain from the detect path. Plug, unplug and IRQ_HPD notifications remain
handled through the existing HPD event path.

Preserve detect-based notifications for other connector types and for
DisplayPort connectors without an HPD source.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1d4502126bff..dbe874d26911 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -315,7 +315,10 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort ||
+		    !bridge_connector->bridge_hpd)
+			drm_bridge_connector_hpd_notify(connector, status,
+							DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:

-- 
2.43.0


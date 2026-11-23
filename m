Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466053;
	b=VXqsdEGZKpNvyUtnwezimzszx/7e8KSwvJZmxr1FDVi2q/CDmSW+iS4S9avLcL0VzbLF
	 9rlUkQGs82h3mFGvpk1A846gFVecDa5DXgNAjp4j59gRDi/I/w8J79ClEs9fXe03t06/E
	 /0jogwZLtVcZlx+TbaYkkNmm5OCH3+LANhrjXR+Avx2zyOSel98XQoOCA32R4pdu6LaB9
	 E2oA/KoFeZ43zymr/J7Ied7ff+jnAwEWrdH+ScmKczZxamqjhMvk9Ut3Nn1ab6Uf0Fxj8
	 Wrx4GWlyxCy7aUOo8KoVMFxMzPx0k1GvHIMMLeLeAYksY7zj1rpKKD8GWLsDLRKf6eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
	b=RXXJHj6FHhTHhK3VdwT324dtRY2qgMLDTmvkoSdcWUXEGSaGxwkOR458FxuuHx0ar9SW
	 QUcJLAfPKBoItvDqxRjdtUMhcmqPAbE7tIDvhULzDr4TFnsA+JwQjJVyx0gPk1KaVkPJ9
	 dg9WsJBY6lZx4hPRm4jkvkilrUhvCVeybomz0zjXtKKzxP3VNiydwLtzQsjwIv2BoCG8Z
	 unIXvAsYWgrvZnEfTKiDSExPouzfgqHd/ruk2Rw372KUQxTzCtWGMJRh9EQsGG9WBuScW
	 +KJWRrZe4iHDr0mE5LuBCr1a9Cpzq08xdHtBCoXLkGTU92nBOLe0XUdCwexKmH+JOaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9Lonnad;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD2606A69C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFAD2606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9Lonnad
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so37039975e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466051; x=1796070851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
        b=j9LonnadtBhcTf4uh0U0BZsh53ugsoPcyeMsAx4M8zEVoUIQZWgx4sd536/f4ke42W
         lzpj1Ltt/hVcEt2NDsDcjBsjhL6TXdtnvHQMM6vxeTXSbmsmCnrbv9f2vKNLe2soN22A
         xBSpTQBvE0IWZwTBwqSReay0ZHWtXtnruWfGeur0k1HgM0c5idG2KW8x5QJpC4dNUx2D
         nLCHdA9w2UntGxU/xuBNR/F2HFG3eohxP+9a9N1MJF6/6vo9XkTN+coK4w3WIriaiLOu
         pPkMuVQgWIesEeKg7fWMjPwkWRDjfxCg5grGIMotONuHmg050PYWgRr4AFL7LyhxCeFn
         Pc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466051; x=1796070851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
        b=iX70afLEV/++3SagX4RNxXdR1iDibt35+4ixpiiBj5aBC8fSir6OZgPap1TOCeT9jN
         YiOGfhB7oTeUZLEhT6q7ro/jDgxj5kpkA0BEn7R4Oo8inW0cxf0GKFSde+T1JKh7rwb9
         GpUEg1APJuw4dEHJRiZIin+GZ2V7hYM7pBAjghjyCIMiBmY3pfeBdhqY+VNiK8TTMeVI
         rH/d0tyjEU1OAWMm8BoCaLQkKpkQfFgWzSy5JJT3UOSVqwJX9YI6nFFRG7uqRLW5xnVp
         ItbrpxDNqFmHVOY7mm3azyV1yUW4s9cZqFPOO8h3XCn1daL9wg6tF3eXMq77CbC4GVO2
         wD5w==
X-Forwarded-Encrypted: i=1; AL+hErG0cpQ1k2QxeZQZgNtvXDnK7hpUAgj/YgRIzSKO9Ky2nJTbY7NXuxXSECM/QcwQDVG14jiXDuN/LwyIvTow@vger.kernel.org
X-Gm-Message-State: APuU4Z89Wg6b+1jygQHs00CLehGKGCsIuJ7W5tng2McbU89PGPzc9fM2
	KF73J6/6rgHysVi8yleb7Md96wgvW+Yrv10p3An5DU+ZfQ5UI7f/RZjU
X-Gm-Gg: AZFdTZe1nuMiJMhGxl1QPxohmqXhXVaINPsNqI3rheFYzkQ0/avQh7hLcny2r43x6Kb
	KmyIWQF/MN3zYTh8i4DlzAV1AqvF1B1/At3foVUWUrTbsAkH7i+dYWIw66+vypmy6lPG1x1fSsa
	lWRI+7i4rgT5xp4agcrzv4EXtsfBZBOslzyDM54zFzxh8l1DfIiMUND7MNoC21F3AfNFr/Tx90j
	XaMpfCojIYnW4AoAnW0C7YbrGiQnrz/vkO5GKpfsHh19u98R/teVJOkHCNxtsNbvWq5EN/NieIn
	a/YjnyUFxlXChGyrNfwKbrkc3TukjXpMkc090iVNU5opiyVSBDCYeLVZ4zOF4eXtXzvTBSh++CS
	Ky9lQwntZJMB0UgIpFo0mx3LfRrb5FWpuzt+qFz2CAJEMEew9tyNP69rRyb0z7wXaRuuwyb63c2
	DYnMJrZqkDNL6HVEcriRm5oCqxMBBPajoTSP7w64CciCveKX/GusshOaRLZ5GBLV5FoHVR1Gg55
	CmaIteLtz6+iRVd0k5FmnQaKaubvgrWh8p3UCCEYfhKx2YzDDKnq+iKdusnzaDHXbkGg/pSGhyX
	ue2UPQ86Z/UXN0S/tM59SiD7cndgfzCReqI/lCecUUWJQAxASt4=
X-Received: by 2002:a05:600c:1548:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb887fe7e0mr275033015e9.9.1795466051182;
        Mon, 23 Nov 2026 12:34:11 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:10 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:54 +0100
Subject: [PATCH 2/5] media: qcom: camss: Look up link frequency from the
 sub-device on the CSI-2 link
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
Message-Id: <20261123-b4-ccs-imx376-v1-2-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=2505;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=SE9OTwNvO9+JP6HZCDsYQZuthYLCpe7RvJgDUw4zQ8k=;
 b=hp2zuUZq1Czsv84vJJBNUjKi1nRxNsBpPpdGFETpRZzJgomrKPLSiFPYImHQcAeT+XcHEeqRD
 dUfY47p4cu+CtXJ/2yK8asGvU6efWWj6ePDXG3u1MfbzlagG0IgUUpw
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

camss_find_sensor_pad() returns the pad of the first sub-device found
upstream of the CSIPHY that has the MEDIA_ENT_F_CAM_SENSOR function. This
is the pixel array for a sensor that consists of several sub-devices, such
as a MIPI CCS one, and the link frequency and the pixel rate are then
looked up from the controls of the pixel array.

The pixel array does not have a link frequency control, and the pixel rate
it has is the rate at which pixels are read out from the array, not the
one on the CSI-2 bus. The link frequency used for the CSIPHY clock and
the settle count and the pixel clock used for the VFE clock rate are then
derived from the wrong rate. On Sony IMX376 that is 800 MHz instead of
400 MHz at a 500 MHz link frequency, and the kernel warns:

  v4l2_get_link_freq_ctrl: Link frequency estimated using pixel rate:
  result might be inaccurate

The controls describing the CSI-2 bus (V4L2_CID_LINK_FREQ and the CSI-2
V4L2_CID_PIXEL_RATE) are those of the sub-device that transmits on the
bus, i.e. the one that CAMSS has bound. Return the pad of that sub-device
instead, as the other CSI-2 receiver drivers do.

For a sensor consisting of a single sub-device the result is the same.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..cf86bf04dfe7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4513,6 +4513,10 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
  * camss_find_sensor_pad - Find the media pad via which the sensor is linked
  * @entity: Media entity to start searching from
  *
+ * The sensor pad is the source pad of the sub-device bound to CAMSS, i.e. the
+ * one that transmits on the CSI-2 bus. For a sensor made of several sub-devices
+ * this is not necessarily the pad of the pixel array.
+ *
  * Return a pointer to sensor media pad or NULL if not found
  */
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
@@ -4530,7 +4534,7 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
 
 		entity = pad->entity;
 
-		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
+		if (v4l2_get_subdev_hostdata(media_entity_to_v4l2_subdev(entity)))
 			return pad;
 	}
 }

-- 
2.56.1


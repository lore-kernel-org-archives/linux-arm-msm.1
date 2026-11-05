Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894567;
	b=2UM2PbUNDprROlQyUBd44irC2Q6Qddsugj4HoG+A+e8Aw8raFyq70G5Yn2rUc3GPpo34
	 RMtD71BUiAktoRAadAzZHFAnW3q3BLulxIrtnVtKRbNgLnv5WONm05GQ5/t7fvgL/IRvw
	 sYKrApf0M0DbZoDpBYb+8OpkmVLQU88guoHrFJKDe2Ch7MGeyV6wr93Nu7evnIagqe/ck
	 anSUeo2xJ33G73mpvPnWnx3WrycNj4IHq25Ws/L9Lc0qUKxgvquawWqbucJ3pUC1W6GY4
	 giJTPJTH7wk2A57tBYt4Pk86JXF4rAmwM5m7FHCOmOBNHY7/ZotiloXXuiCLl0JTUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UlwLNv5+tELfF8ZzeIxrYsemrkgdO9m/e3laajhv55c=;
	b=YLZYOzzkAqNcgWDjamE2irdaBSEUopHuB/jvt0Vyy+6BImIkVu94M7nzmRKCkroWhK9z
	 snjCUCo8eBJF4UmvIbPqTXs9iw6+RPQkf6DcgPCAi4F1UlvzwyrC0VYm+pzvpuVPqjpL4
	 A4XQ1xccTC08eLP8dFvEmXLJIkaO/4LPJ2ymnOF3FJMbvlypu+fdbbC0yfg5rGGYz5R4f
	 qzV1KEqtPxRt8DCDijU/gawmC6sW1Z+AfK7CYF5SDcFAVP0gc8h6NcknPO4JhYiJ0ClBE
	 +lW26jPcnSLH8j8IMFKfM0YzvWg0qBzEcTVQ6M4ZxzarH7NjtXqM3jbiCASj4yaz9UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eYpfcGXc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yk8yUP5H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF203606BE9D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF203606BE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eYpfcGXc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yk8yUP5H
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQA7N686800
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UlwLNv5+tELfF8ZzeIxrYs
	emrkgdO9m/e3laajhv55c=; b=eYpfcGXcvBjX9p/cQXrfl4/mW0jEmytl8D5tgh
	cbeeYJDRwTcv0tIzGkGtJDSSsARjDphRl8nXcfJ/hLTwQnbfzt1pHx73hELelwlS
	OttjidSVyy9OG0g6CrkQt1SJcrmV+Oq28BBOzToho6a3E3iEDQ365h3nvqFo5fyw
	rc1aQMUeg5pcN8inDF4lCNyMTYTCV5aHzgO43Ayz5Wzu0Dn4FGiQ64Gq6Dar8nMM
	Wf6X/D/7wjbva5HifO/A/9uQzNDCXmIRyWoJSjGUKhKJCaPL6/IonMiQYPhYwg8I
	gnoXdOctM7jJaxeBlfA3GWEDJgwTTupkdN1C25lE3jQsBfRA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p1r2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:02:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ead18311ebso565515e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894565; x=1794499365; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UlwLNv5+tELfF8ZzeIxrYsemrkgdO9m/e3laajhv55c=;
        b=Yk8yUP5HJlAzO482gpzPywQNO0Et1+IKOa2C15hmM3YkeVXXxJAjOBTM6hEPsv3Zhz
         etJjKwAFqjrIcB4r5Dxu2cQEwdr2ZWdMutuYbB3Vzu1p+axYaUXkTj0EbO0YFdlWaAkE
         lfCO+MiQIzjn01odyS898PPlScclBTqJaSAE7Sy/kmCHoXHpWgshhR67BUO26Ck6aCuN
         TiUzJzkJ5M6kUwHQXhTaW6fdHxDCBFdIZKEWRZjWtXUWFT0185S3yrTxKWKQtKQQvq0B
         Rksf2/G7AUHY76JR/PYhgmbxIUhNB8YEJlfHyAL7y2FNcJMVhD4k91bjmiyIzTtWqQ3M
         1z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894565; x=1794499365;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UlwLNv5+tELfF8ZzeIxrYsemrkgdO9m/e3laajhv55c=;
        b=LBdgAwHuAbIuVkIhYawisvWTDd58nvErmsfpUBQ/rX1QNKJ+hs42ec6cDsGL26JPig
         Kh3PAWP+bSajIIO8eCFu0H7pcD89rv9U7vvbEij6KFlZUcmVO542BmlP/0BaXWIg//yM
         1em/M2J9l8hxQ9SztX8lJMC9r3tsdZ6ll1ZIZWKESKlXuDqrg5z023MMUVUtm+qO1ROa
         bYMmm38oDzSFvAhI3+sBxzPOSrUjSYGnQDCAIfS8xeF05SLd9yiOOduDcp7MVjKd/rMB
         32/ukpX4Mo6v3QjKOiH+6ev891f+Tgf9iDIfQlXhthi7uFjO5xCuEBAV1QZvxAUatHKG
         ZGjw==
X-Forwarded-Encrypted: i=1; AKwUvBwa8wgqW7AgF20wlTwrC5PZSGLUjtyRMf0SXBjP1dWTvW8xt7rGVEN1rDiqa0T3g/wvBS9mDPt/BtQIO/Ou@vger.kernel.org
X-Gm-Message-State: APuU4Z/MQRSjQT0SmCeASuSbKkgvVfrxxhFx2Of0d5DgKhE44rDMB6Vp
	2pDXpo6K/HLujvSHkUr9VVJw7lWBmGliI+kmQunPehhD4/siSi4BUQgnGOYu82i39FID6CGgjkx
	VYPnVlvVwqL8KqHPur+r+8k/7Ee8a74iwWgSRFWtJ1xu7N9w3ZoRG+sqQBcmQBs3LvSOc
X-Gm-Gg: AYBFou2ps6UcxD3IUImDfMF+eCbHWMClxAE8VNAzazUtSzpWjTfIzvjmHHFkcdtxiZG
	kpTtA8ObaA515DUWApd94sBbWVp5LYTTo2JgjMxGDDFiTt3A2bYhS1iT+pl1xF2CiGo6mtemanI
	5Sdf3D4GvIhhYOogdRnRhSaPcLHN0IJVsSIOtvobBhwqLYCTXxRz+JesSlFmo2TqqL0fMPTqrJU
	yb2W0erNmeRJGE7EZgNVvsH5lS1kScjoPcBZ6qh7ZpkOoMdVmPslBGx3HPIrO4rc76aq2NXAPH1
	9lbnx2WV1zXbl1f2/LoDxLbhVcS7Fec2R/CzJgJHcSt2lXIn/uDD2Fu9d89VJwPTHKnUqKr7FrJ
	M78amHNWgfG68R+ZCf49eSf4Yj6EOgtgppH+RGx4zS3miTMRnRGfX3/Mj8Q==
X-Received: by 2002:a05:6122:218b:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ec6881c31bmr9347133e0c.10.1793894564763;
        Thu, 05 Nov 2026 08:02:44 -0800 (PST)
X-Received: by 2002:a05:6122:218b:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ec6881c31bmr9347058e0c.10.1793894564046;
        Thu, 05 Nov 2026 08:02:44 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20521sm11065672f8f.53.2026.11.05.08.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:02:43 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] ASoC: qcom: x1e80100: allow WSA channel map
 override
Date: Thu, 05 Nov 2026 18:02:00 +0200
Message-Id: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHio7GoC/52Oyw6CMBBFf8V07ZChPHXlfxgWpYxS0wdQQAzh3
 y34B24mOcm998zKPA2KPLueVjbQrLxyNkByPjHZCvskUE1gxpHnWPAU6hS8m2wDvXQGlphKjBF
 BaO3eMEkDe82SBiM6yOoLyZoXsshzFia7gR5qOXT36sd+ql8kx92xJ1rlRzd8jn9mvuf+VM8cE
 LgUiYx5hhiXN+d91E9Ch7KJwmHVtm1f+axXQwEBAAA=
X-Change-ID: 20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-5b9ecb27c766
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2719;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=U5piwvNZRG1cHLfWCFnEXueR124Qs/vWofw3DYDWQeA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7KieCQbWjnt7KCLcMKHEpza6c7UkOlMSDcyw/
 TJiBbPkVsyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauyongAKCRAbX0TJAJUV
 VoeMD/9C1oNm6MPOL8S3tCs6Ie9luZxX/08iHLm8pGJru8IdK+kZ7spOKxFO8WACfydGgjN7IZJ
 P1HQiM9ZDaagFcXlTItq3JRxYXhx6z15rNcFllVuJbKxnj7AxUFIqWEioaWOXQWJx1e5cQlBKNN
 0HsnaZ7lDMoqp7V6D7m/y6zZe/2bEA6EY9P92ZmDpBuTWr/pKKYOGORngMB8fJBtrBH8L5vqyIe
 RhKrjTUGAJkkGpm+SzIX7MSe0fTqcXkAFUKNjOJzetAeUIe/UHmN4g3E1iA7qrs1wg4LOUgBQdC
 s7Y8sFNTo7HFcJ5q5t0JmV9KGn1LLBjPwqjvpkLBUEhPhPbluTg+y+alY96FW3dgGqPUpaaDhSW
 a0JMeps6518Mz8p89doKIUELYNC2tOA4NSZPzXtbj8UCOE5U2D1nb3nmfA9OUO2+698bw1bN3Tt
 o8bXUK1gA7XcgI6Ja/6l/1Yu/LgCixGME+wrx/POGubkIqdX+6uu3enDwznEMT9YpuHW+k5q2aJ
 5pEgwINWZCTcTqPKYKbsGFrCZy4XRaQvTyU8epZ7mX6WQDxoW3mieDZodbd1GghTVxb1ALm5QyN
 60kzTG6lYuAswdJDpaM32fiA+I370HmjAgu3OcKswmZQy/IDSNbQry+zteVicZQOOxK/3+zoH6m
 E9TzwOnFMIrOUVA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aeca8a5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=SGIR3ObuRCJqBXPODGMA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: BkhFhz0zJwt8nJidJPu_ml70l680m18m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfXwgLLsB6lX/3J
 L6QtsHIiQ/ylh4PfrTtJzKCSuZC7Lyh+1q6KVh/YzFrjtdBX7e6ooQKR5U62mPssgRwIz1wsIiD
 RW7FwYoo2yhWedA84K3XiAd3ywnD46vtNXmfZ17+jBOa4o7/7f9XjsBUDaYP9avvayT+vUpzkIx
 7ij0Vj+uAJk1nh5M0pL7m/SaYYtJuTKUS9u/gNp+jQjTeMRxYOPgvltMYkXptIE/DIxkKVSntIl
 zBO1bKqYsBoWaTiIvS52BY1cJbiHEdEY5JMs9/ad6iQ4bO1KUT2QWeGYHlM3GO9o396mBonuYe+
 XIDEiLkYFOzQOrdZ5YCUeMCf7tDgGLenHu01Iwss908Sw7Cth6Qqk5CtxTw3jz6g8MQZjagZ0vH
 itP+ryG1pjUpXweh1OF43yL3Q363RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX/q9BWyqdZZJl
 3uPXWKYrfwNBaSBF8tnjzY/JsOq1OiynJEeS/Soz7xGcBmEKhVKAUoQSHRizzJmKkdUOIGDu2sF
 V9zaQI2O0QQ4NPP6xDHnoR0yzt8B1uY=
X-Proofpoint-ORIG-GUID: BkhFhz0zJwt8nJidJPu_ml70l680m18m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611050063

The x1e80100 machine driver currently derives the WSA RX slot map only
from the runtime channel count and programs that map unconditionally in
.prepare(). This means userspace cannot override the speaker channel map
from UCM.

Add a small ALSA core helper to register channel map controls under a
custom name (so the WSA maps are not confused with the DP/HDMI
"Playback Channel Map" controls on the same card), a common helper to
translate SNDRV_CHMAP_* positions into Q6 PCM_CHANNEL_* slots, and
writable "WSA Playback Channel Map" / "WSA2 Playback Channel Map"
controls on the WSA backend PCMs in the x1e80100 machine driver.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.

Changes in v3:
- Rebased on next-20261105.
- Switch to the approach suggested by Srini on v1: add
  snd_pcm_add_named_chmap_ctls() to the ALSA core and register the WSA
  channel map controls on the backend PCMs from late_probe, instead of
  card-level mixer controls with a hand-rolled TLV callback. The v2
  claim that no_pcm backend links have no PCM instance was wrong; they
  get an internal PCM from soc_new_pcm().
- Use a per-WSA-port index for the stored channel map instead of
  indexing by AFE port.
- Link to v2: https://patch.msgid.link/20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260723.
- Return 1 from the control put callback when the map changes.
- Allow up to six WSA channels for Glymur.
- Use WSA-specific control names.
- Expose standard ALSA channel maps through TLV data.
- Move the SNDRV_CHMAP_* to Q6 PCM_CHANNEL_* conversion helper into
  qcom common code.
- Register card-level controls because the WSA backend links are no_pcm
  and have no PCM instance available at card init.
- Link to v1: https://patch.msgid.link/20260610-sound-qcom-x1e80100-allow-ucm-channel-map-v1-1-9339724994f5@oss.qualcomm.com

---
Abel Vesa (2):
      ASoC: qcom: common: Add SNDRV channel map to Q6 slot helper
      ASoC: qcom: x1e80100: Allow userspace WSA RX chmap override

Srinivas Kandagatla (1):
      ALSA: pcm: Add snd_pcm_add_named_chmap_ctls() for custom control names

 include/sound/pcm.h       |   6 ++
 sound/core/pcm_lib.c      |  48 +++++++++---
 sound/soc/qcom/common.c   |  30 +++++++
 sound/soc/qcom/common.h   |   1 +
 sound/soc/qcom/x1e80100.c | 193 +++++++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 264 insertions(+), 14 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-5b9ecb27c766

Best regards,
--  

Abel


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810551;
	b=G/Rv0SFZfsDMsKdh6htcGhzUu6kK0xZ5z7f3mADruDA0GI7hZnIc4K1yCzNFjtzoKuuo
	 1C+5Lm6zY4QELzthpLfriKaziZDPphFmJY18vfiN7plwf2hMbkzrLUtHNk9K6anKV9Y2g
	 CdKI+W/3oOGgUfSvvB3IP29k+ymN8jYGY1Eb0E1yLT2Ubfx2OLD49+io5kaJIzqa8zdoF
	 lOT/t2p/e9MxSqk9HXonHWX6RYB4HAQag+e9kJ/5a5g70lbJi3zoAsIokmVXIPAjpntAL
	 t5YpBr+lMq7qKMRYYqXl7SyNXfrQpUqxxkrjgPMn/psxxHKR1+Y77KUB1en6OTT0SsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zf4MCgV25Xzk454J9ButugmWv3++ZMym7a/D1rsCAe0=;
	b=0LCKWtLAX0/1Wv6j5mmz5Eqtr6HSd63vO9aGHYKxBkJrGRZX8cC/kZaMrfeOkcIwwZpP
	 m0W/Pnk4G2QuYHPhqQyQn1PNcCOZkC1MTJ6i0lqNo/ZvVgRCZ00sH89C/VhDMUaL1EdQr
	 xloYZNsXpPfuosrHASlgTSJF3KlHoWdnBGuZtp50O95wA2HIGQyV73jdkH/7209vbfpVC
	 F0XRyVdP4aX7YNi8SBbYafdqrb5B7WzjZ2cmCTJkF4+LfQNLjuZxfz9KfYmXGZgdt3vxV
	 jE4hV89Zm4/Tm40uG8MdipS5EHyIgreHmgICTCvd06AWaoPmNJAEzyvf+ccp9B+qvkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecDp2Akh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RRFNJP8H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D142606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D142606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecDp2Akh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RRFNJP8H
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRjgP1381751
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zf4MCgV25Xzk454J9ButugmWv3++ZMym7a/D1rsCAe0=; b=ecDp2AkhlC3Ho5gN
	CKLdzVlH54v70kSmVhgEaW1HWPiFlyCFwqTjN8CI8hMrSe0ym6221eZykkmC+0kF
	07a/cbEqMLkbchj3WcVnkoHdMbVvoiXbKIVy6T5WgIZk6Bb7/tPL7vcsvxl/BDRr
	YvOxiCRsZr5iZYv0WEKVj5Emd1VfabDjSvguJ7/bxn8jUgQX8/cQhOM15qGuDojc
	RPH6pKk7k7PV4boV+UmHnV/86oMrPwVHpOm6oF1jY8qNQKYsjBbWVwSMC1KR5mC0
	MDdsDzRN1liKrJFexRGFKAS30olD/URnL/U6I+tWURK2zbnm8mQfC4wxXik/IYp/
	yvtmgw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s8386-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:50 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece45cb25bso2130309e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810550; x=1796415350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf4MCgV25Xzk454J9ButugmWv3++ZMym7a/D1rsCAe0=;
        b=RRFNJP8H6FnBzyVx5AQeqWXCpKBUrELpvWztXN0KMI7LVOM50e4pHFjSC/edOImJos
         aEpeJpX67Gk6SJNw2gix8FkKG7zXQegBPldAfjuD/d65elbq10lG9b7TDZnSux9E+YZD
         4J0usN2r7/z9D4ESNvpPwnrvObW9gjWZjcRi3NWHGFqhGFks/f5H2QXsiagnIoJl6J1u
         b7vQQgIc9pD+DimZnoPLD9zlxkJDN07m/IdYVoiFuCIfloNKSpV4/A/zIv2y4ACZmca7
         tywjDD2nPlMeGIJYxRR7lEQdf7P5Hquo4DBjT0lGDFxeBgxCe9NfxqcL+pN9jOOgCmQt
         4Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810550; x=1796415350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zf4MCgV25Xzk454J9ButugmWv3++ZMym7a/D1rsCAe0=;
        b=0OsTNjaoWnmQK5BqeUJHW3tLjV2nXshYW2U8fa8uRiDEIeSsfiqPEh1lexQDscZZhI
         CbauR7f2LCNeShVlVbyYOF63+h3rhJ+rl4cg0NmF5ayPLZGVdw4XHA+w3qtH7OhRBw7f
         atVUdBBbJBYdpdv2gCYxtGmSM/sxUJcpXCcz4rAZ2rwGHRpkSYVdi/3c2l369O1Qp9WE
         a92/sog18DSyHU2TZUcYeN8MAjn61cYzjQ7ZY7M73c493jot/ZfgqbmMhvZhP3rV/vMX
         g+r3Mx7meShN3DKGneH3BFt8ELkuFwPBZ2uYMF9j21CjaIwJSJ1ow85JFkXtjrUp7CA3
         Vlsg==
X-Gm-Message-State: APuU4Z9MRRQSbkHyflSj0aBAS0uCT3JcVle4Lt428yOU4EfJiimlluXz
	W7VHHbFzjYJnOcqk7rMRNH3tays7UacYaySnmNkpCCCCIN1mn6J9bemjC4S8YuqEy2APRmHPi+P
	YXbilJDAlh4yS6o5q93l2PENtnwn4EvMlYpf5z3IDqDFrRdLifBdbPF/+e5m6m7K7hxZd
X-Gm-Gg: AZFdTZf1B4y382Zy13KYwiRjdvjBKyQD65KII/y89BK0V4Wf6Y8lEqpFl+w3+fuvasg
	CZcutFJA2tTuwKW3J3wUpA8TQUS+/UFKxD3eR52ZHnWsuUXzeTZYWV3BbU+r1ha3XPmlt1YWiBZ
	ptU+dI+pPXvZj3HlFYutaSxfywyzE07pnlZprN7PU/XJMG7AuBoMPRxDdzG3xa8EWCC3jbwYibo
	X8OpYgEI4F5irVvDi5AC9JfChTAJ9T9t+KpXUYw+wgVtryy92phRRXkVKxNxCv7sDf49bMXsX0e
	sXxLv9m0OD6xeB+4n9yHZp6N8gC6S4dYwkTDBidK9beMLfnJpvGV4PKFytm0D9O0fRf55xcWQli
	NSd9BOI5OuYHrPpX54qrXWiXTWH0y1t79SeewNC1ulcipA2B5kvFKkn93+YsZffgTSBQ4mEmn4w
	ttO74yjCCZ+Ud7ymrGcf1kfEe9LV8xWmWbEk4vkL9aj/uOyU17T7FE89RfZ+2W9g==
X-Received: by 2002:a05:6122:4307:b0:5ee:9f4:e329 with SMTP id 71dfb90a1353d-5ee8aedb9b1mr15797446e0c.9.1795810549469;
        Fri, 27 Nov 2026 12:15:49 -0800 (PST)
X-Received: by 2002:a05:6122:4307:b0:5ee:9f4:e329 with SMTP id 71dfb90a1353d-5ee8aedb9b1mr15797387e0c.9.1795810548772;
        Fri, 27 Nov 2026 12:15:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050fddfsm64591511fa.16.2026.11.27.12.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 22:15:26 +0200
Subject: [PATCH v2 2/3] drm/msm/a3xx: update the CP protected register
 ranges
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
Message-Id: <20261127-a3xx-fix-me-v2-2-839408d293ed@oss.qualcomm.com>
References: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
In-Reply-To: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DFPI2L45u4oeaZLXWc3gaFnF3XyyMFzyyM7xHVl7fj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCeTqySKzbLWyHD8jrjH8XklT2NtijcfHpo0s4
 Gh0rY0JKQ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawnk6gAKCRCLPIo+Aiko
 1fHgB/0WtDn05oOeM6hZu/GTe/PDgzLUFl3c7F0Z+9ryG+NGjzMMfp0BRbkJ2e0F253KW8scQzw
 cVRKagu/IxlmB2JVhSMS8rNHkFoBXtRfFdZqSc/uN1UvkmsqyGfIPp/YuAJM/aZ8KolngRn+Emb
 gebc8Vzm+ns8ZBuPB1yJYGcMfO32+SUVjHXOfSRsEtcBGfW8dXtAZlP5AxYn1hmiQHRMSrrZIoT
 Ugxj1VlxG2dReGV8nXWBHDwYTDCrBlQ+mwmpPRNsrsc/RBxZ9eHotgExhG77bnvunoiuoMfP9Xt
 6T4Kg1K+vejGX834xbzrcB7kEiju4hIIcgg2x0MDunzVrDqB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09e4f6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GtkpO-_-v3sBSqm_DCAA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: nSREBmclOA_kNMATneoKbRfSD2k-EO3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX+a+noEdCE1Tx
 Cy6mh1CmeBV1jDmbY3LHqAeJV6dRC7ZIwRMy8Zuo/8AzUJ484UDug98EsR+Gwxd8ORqHmRKD1fF
 T+7BM7k7NpdH+3NKe0v5hCGJugXs/O8QaQwEbOq8le4royVjrbySM753X4DsC9FLRr9Bmmxx2VS
 CgITH3M7aauqtB0GADmKp6xSFK5YdcAiOUl2R06sjNyZp5THrUfsN9+moW5S4WEmYXo91LLW7Ai
 ztDtfaGaR3GMS5zXGzJSSdL6bRXXwGtBw+kNmqu4jfh7fcTjyCou7yDGyiqfUpRIdnATwWwNowA
 q96dz9U4aXll7A15CWk76dymA1VEMKNHeflYFm2a6i1I2pHeVBOMc4PBs50bzZHilUg4owysSAV
 0Dm9jh257pmlK1isi279e/pk3rDg7nPi2vk/aXkN9QlSiPcnzqwIVqQMnwvpNC/I3OV2JQZq6je
 DAJhc7S6k7CXpsmswAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX/1KAnkz7QAGX
 XJ1NbJM+KDH+P7yyeLYn1aQnoPVa21+sMgIW0WrJJxg3VqiXzcPPzGuXJOX4tN4dsGS1fcxnDhy
 NEe3NUJ/c+ZMgPcPHO1aL0hpJidA124=
X-Proofpoint-ORIG-GUID: nSREBmclOA_kNMATneoKbRfSD2k-EO3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

The protected register table was taken from the msm-3.4 downstream
driver. Update it to the ranges of the msm-3.10 kgsl driver, keeping the
wider 0x100-0x13f RBBM range and also covering the VBIF QoS and AXI
registers at 0x3040-0x305f that the driver programs.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index bd4b3ef7bc12..6a9e0e87a8d9 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -288,25 +288,28 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A3XX_CP_PROTECT_CTRL, 0x00000007);
 
 	/* RBBM registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(0), 0x63000040);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(0), 0x60000060);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(1), 0x62000080);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(2), 0x600000cc);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(3), 0x60000108);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(4), 0x64000140);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(5), 0x66000400);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(5), 0x6000018c);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(6), 0x66000400);
 
 	/* CP registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(6), 0x65000700);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(7), 0x610007d8);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(8), 0x620007e0);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(9), 0x61001178);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(10), 0x64001180);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(7), 0x65000700);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(8), 0x610007b0);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(9), 0x610007d8);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(10), 0x620007e0);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(11), 0x61001178);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(12), 0x64001180);
 
 	/* RB registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(11), 0x60003300);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(13), 0x60003300);
 
 	/* VBIF registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(12), 0x6b00c000);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(14), 0x6600c000);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(15), 0x6500c100);
 
 	/* NOTE: PM4/micro-engine firmware registers look to be the same
 	 * for a2xx and a3xx.. we could possibly push that part down to

-- 
2.47.3


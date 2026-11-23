Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458540;
	b=U9tpMbJA41/wGOPpRM+L94t6c92c0MabkqRpMtu/Yfk1rhecW7MnLa33BgPiC3LM9FSy
	 S9rO7Sm8HKRC/8zNBtmfx/hydUzIBBCu5SbhAEoOl3lQJGzQ29kOgGUtO9xnoPzNp0qX/
	 xNacJfvMP3WX2kQplDvmSoR/0YMnWL7PQ1CkUJI7/IvfgC4le+b99kj3iA0BwZhON+oik
	 KCggWBzmX5qO1By99c6sJhQAtpg+uMQB0ijtdxLsdKhpzi76E9/rBHncsxZV/zB/CGkFH
	 hbPjIPKWvTEApwHK9Dln1m0/HWP5gpTubC54R1uk6MJj3Kw5ZUyTpJe4ywHg3T4ZAtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
	b=sGVK/GvHgfQjemYwKNBt7VQqn+UNGDQMc4YNvBtUPlcNoZn6G0NY7L4HPdncQbnGPc6Y
	 7eal0Y65GX7K1W5doaBHNrplfOj0dXRwUYUGq4xeaKn2DCAPtfx6Ey0+tb9b6O+yB1v9j
	 sqvHo/mkUtdhKDKdJ201aEzKLOazfmId29nYRAcjc3bYwe/q57DpJzMM28dDk58CPpYVG
	 7z3iAvHl/Qni849bDDbCtpLqL1BrGcR9TxVnkLBlWaXyZJws6YMFhWVHDfeRseRyyHFA0
	 0ZvJXC/6itp55CiFpOvFohMjsyEU5qSnustzWh88ro4GlvJw7m0EKskcAMkY/EJ7HJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiNeKvG9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EGk2KU6r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C403160A3804
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C403160A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiNeKvG9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EGk2KU6r
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH2ut3475189
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sm66atK5a1c
	4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=; b=KiNeKvG9EQ/jqrIVLDZML9PSqFd
	DNln8baOvDpLn3OJB8cmnRSbWdB76Y3WnUVYt7iT2v26U/LoPivaZJVSQkW2Vhmq
	x8+m5MHoWNRp9LL51wywzfrXMTUuMBL6+ECaYVwe9Aa/x+dKrdH6dCkaNnnrTqih
	JapZSD3wCa5ZEPuRj2Rcjc2uewnxQGWCuNeMTJatoZg49Tka9EVhT+ej3eqp+rRI
	P6kTw5AHzuP1+Lvp3/w5KjlTweYLT64qLI3fC//U+qPOw3vwITERqqnO5iS3QtRl
	G6Dyr7WppUu0eJtNnsdQRtkbNYe6qqNuzVQwq1eD7NemUWUNFJSsvxJBxSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tg60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso5048698eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458538; x=1796063338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
        b=EGk2KU6r5LIh2u7O7gspDdqBhQ1Ebauh3zYfmahEihwkVZGnoLEh0yDxMFyWnYdxvh
         V/Jhdv65eSLYPd8z5Zha90GmCy+6+2BsTNMD/ty1ni+2kBtDRV31qSDzMZTPEB682fZd
         A2obY7dMgScrh+D6v7aIBBdLLpcYGAsiaD4qF89Zqy4zM4XLAbhtSSIGU4HkC23Eqr8K
         4LIbVN+cZdxCN38e5k5uweHAO6/ccQInT9yJDMzQaD2czvo7+U+fCGjZd3GgD1xo/S9g
         7uirdMMDUMLN0ipJdPKMadHeXmGV/LQ+TUOTONlOQVD+B+LiYeS9QWGJ9yDXo4RxEAUj
         kFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458538; x=1796063338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
        b=m0IitYyYBfa7USnv0GknyzjVUgT2eqo6eKA3EukCbjl4kybGsSZiqyJOc2sEXbsmFC
         RMigMAD2+FysNK07uVLHf4MZLNy4qxTftRgWIO3NvpUN8SK9JouYKZRWMqqsHYvm61ms
         guf0kf+Lxz/0oE+yfJW9gdyv3TXDqfzdusouVeVi/tULH9hMppf9QgoVRycmOmcTNGEW
         8+9DYbsX153jFcS9WdToFfzHMO+NaxHNIdUv7pZxj9bMaWrjcWyXFlkTy1/Et92UhWBz
         95BB/8gEBURMn1/mekSwmPLNbtVwCfsbuQ5jmqwRJXlR6G/LuYMhEJJqigmTq0pkd0H+
         czwg==
X-Gm-Message-State: APuU4Z98/tYP8vVS2arwftDlsj5wFtgm8XkSdsVGvMFlK0pKSZbx6oOD
	HpDzUXVFkV4AaGccT1GIuhMHAD+BGkqv3Nogl/cxtZwAEy2fJn6unD2xqnVedwE3XY8O66IXdnK
	87/2o0EaEShnUWlil9Ugw7aEk6J9g3F5Hkd2fPmsknxQJl9No88PVL2xyHnPQG6QcNK+B
X-Gm-Gg: AZFdTZcoPe5fdiD7IDINizKv4EF0LZdyB2n6QGdkz7liBhNqh+hKtF1w6knKMBhmE6M
	AVqTqCdeSKdf+ump3AY5xVtGeUOd9iPz5DLzQM6EskqWoeTQp1dMZVl/MM18Td9urWA9tRmUrEQ
	l+Jzr8LiZQL+ZfkVJb9+c0EQJmRHxw3OXnIk+z3K95PNUsdGb4N87RaZO5noLAA3++R9dLZFtbk
	rq2FFmWxwU4y4+BvFeb21xkN/V8bvWvZsNgL7pWR3HaOMRoklaFDQ1fRZqJA14TmW7xfkigLpTl
	dyIB1QwkU5k1aH0toWxflJkivYbxVK3Xtbbbg5zPdVYth/o7q8ArfqklVkBGCW1J4Uw5pRb83e7
	YSUXXHQ51q1Ah5wCZHFt93/Jg1Ne8MIRPnYpPoXOPAxlNMRoVufJDbvHuxpGQbaEI1Xyh6dE3q6
	4+51gzjWVFszkf/ExTl1OSPZ8z7g==
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr3423232eec.7.1795458537733;
        Mon, 23 Nov 2026 10:28:57 -0800 (PST)
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr3423204eec.7.1795458537235;
        Mon, 23 Nov 2026 10:28:57 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:56 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 7/7] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Mon, 23 Nov 2026 10:28:47 -0800
Message-Id: <20261123182847.143892-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0485ea cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX3p3l2RUTxRZ/
 nBbeQJbPFB+bH0al4MpS0igM7rfQ7q2ZTiDE6MhJvlj82uxabomgLMkYhZ6XGQoYnhf6/YuPVPf
 gq04GcgIi1LMDbcU1iyOf/SQvlfoFIwb3yKCWDqasC5kNqr6T7YmpVH1uym9o1+jXshc5Jph5U4
 F6MIyCBuhDCtDWIMzR7cQoKhE/dMRRZVGvAiEyFfJoRvVqltgCfcGeR8ssldAVc8lCuZOaklxpT
 KqPnh3/CZor29wCDyCIhqLuBoxSXs0W1jWNosViLNRxdu+4uYWvGc6/cwEwLoihkNYprd3JD9Jl
 A0NuX/zjohcb1csGfgIgQGUuF/QIcqJVtwA6qm95S4whEW0U2tnbnrx+L7xpcAGjSMgk/OdTwBI
 StV8srduUZgQldnsNoRbtu7IQwkB2d3EpcaejZr2BQcxcch9Y/STIvmh7OaKmTmdeZUZpuU2uIn
 9YTSiR7wF9+rIKcUqrw==
X-Proofpoint-GUID: mlAwbEHie8wyfFdAy03CJYp-WwlFlh4C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX5kr4hhVV2QLE
 cy0ocNJWdoaUBrCW0XDYda2whshUb5IzQdoHf8PEMtu+H4feZcIzVGmYge+bJejVyVe4Fmx9aZ9
 CeZ30heh2eXYOnBtUYBv7Lg9r2XMh5Y=
X-Proofpoint-ORIG-GUID: mlAwbEHie8wyfFdAy03CJYp-WwlFlh4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index b434b0447613..eba2ace4f3a1 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	path = chip->paths[chip->port_idx];
 
 	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		/*
+		 * EUD virtual attach/detach event handling for low power debugging:
+		 *
+		 * When EUD is enabled in debug mode, the device remains physically
+		 * connected to the PC throughout the debug session, keeping the USB
+		 * controller active. This prevents testing of low power scenarios that
+		 * require USB disconnection.
+		 *
+		 * EUD solves this by providing virtual USB attach/detach events while
+		 * maintaining the physical connection. These events are triggered from
+		 * the Host PC via the enumerated EUD control interface and delivered
+		 * to the EUD driver as interrupts.
+		 *
+		 * These notifications are forwarded to the USB controller through role
+		 * switch framework.
+		 */
 		if (chip->usb_attached)
 			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 		else
-			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 		if (ret)
 			dev_err(chip->dev, "failed to set role switch\n");
 	}
-- 
2.34.1


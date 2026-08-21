Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A447DD59
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308039; cv=none; b=rOLpHQRP0ZJ3TAhE49wqA3UjqNL0/qdoNbUW3w64EMUnCX1WZQAspi6ZyRHF4fPu6lPfcW1O8jdb7lGpBo9TzvQ2j6HurC97GxoAcj5t1AgIB856SnPhKhrkQ9netg9+/ZWbyIVb7qCouC5QI9jINLOB/9PFnL6W0KZNJhOWuc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308039; c=relaxed/simple;
	bh=c/DbwxB00h4bCHsVWfXDLZ7vX3Lz9v0Rhy2xTpHLGyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ak1GdYxPQ9kO1YqMQMzvdS0lRJAHekgKab0yzt0x1H/0AnD6fN3N7bRRuduWJnt03Ngllb9s5mbDdy/c1Y+i8Ju9sQw33SdQg8uTl8Ko2Tgdr+wfxEkdYG8NMt0ZL2GDWSGa19xEUtWErLS7Ol79+/tlQA/NP1ET/j/VooV63p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdZa/j+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEl7ckNe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdZa/j+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEl7ckNe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9M9ao1896313
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=; b=KdZa/j+VUlduQbgU
	Zz3x6FaKzMaOOdoIkdDtjiXS/fGhlNBVOh5KBSuvbImhBxZnMvnuf8tG17XD6mnV
	NLKfzkCC93MYoWo4Z4KBuxpLwN0U//7E67qExENxBm54HxUrBT0MtzUa245fxZtL
	6zvmxRIE9Fvnkdt1M748tLbGZvIOxDZb5eOKsmR7pLh4syHopCwI2d7kTFG4qKZ/
	iUXWE4VF+88YHidXtfvBt7rp3p/sJmCcE6WbvDNzQjLhwBo5V7VE1HPWOAZ2vz1l
	U/XqR2jbg0JcTEytowGLDFFGZB8EnC0zCbxMQop3fDRfep9EihIp48wks0T4D1wr
	wau7uQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdn94fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so1328105a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308028; x=1787912828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=;
        b=DEl7ckNe1GeyEcYCDpSf6ozJrIw2B7gAiLjMC2R2x2rRYazdXTVIM7cJr6ZXH42QZi
         zRQ/iOuI6GaSuG2ceZ4BHEYJAeecQqJVV1k06EWlGAwFUdh8gJZ/7LBeaPgFF4+A8x8r
         viuKIugHKTPMigFvVM9HsFxSVhZiQ4cThOkZcPoOfTF58PcPt51XbqfiZTKDsl0JKnIH
         wDfyruhggPqZw4OqDhDQQHxlZBJbo6e0t/N+qDa+5X7C70Ol9whxZPYGxeKZq8ibPy6i
         UBfN+308jwGnL5NUdYSGL08+Bv2pDw2lTqkpz9Zg7SJn23OnHbJRlvjKvpGgCzek2ez1
         uy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308028; x=1787912828;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=;
        b=baC0SW8cPCXYQVjr3MMN1FI4FjJEU4EldSGdpHbX8VhcqqW1iQneQ1geVb20uuOp8R
         Q+wpjdH8jP7DiD0EALSMcLBtFlHKm1LQKtNBkV/oJMLyN5d+YEz4bTVehB9EBts7z+gQ
         o0CU9vZXTaRTyLh6XLyRD0XdL2tCWkuAb06VOKPE75/70wmB+7fWsCU4JibB9a5Z9Uw0
         5l2CE/isp6l+bw0cB/09ct6H7PVObftmEMeWQm8/4+GDgdg6ogI4emFbchP+7cKtQr/8
         SepeQKWPC1Pko1/siJya9plOJl5RXaNmSomA4c8oB5nzKw5mZ8mUW+WrxYLn/nSOZWxf
         ma2g==
X-Forwarded-Encrypted: i=1; AHgh+Rodoe68wNUl18aqj7IGtxZXwyvbfRdfuhHXYra9jF3P6/UyZQNL/TF+onx98xj5MmO/6nu3q3yPiyD3Utvt@vger.kernel.org
X-Gm-Message-State: AFuF++lFKydtll2iDUBU5OdX1HqLGRCERHs5SHynymdmIGiX0TlDJe5k
	iieS+CZ3d6pDgPPxzZ9/kRT6s+JMUu+695D7khD4HGEMg9uqB4T9XZ9YtHY/rjDNcwb7eGBlYEz
	OE9zuPUp4yHkM9z2Gz8fa2jdLOYXuRodQtu7XA0gG7aqSoK/5QfmswhAkGwsu8iKjB0dP
X-Gm-Gg: AR+sD12OL0MboX8nosPIx7wOjEoRpSKRIXDNmM4Lm65QfuPT2bE1bDNwDr6TLsk61rF
	Q97BIu5HPc1ZkPlWyXH6nwvJfoEUzMvuQK2aluAomFIlt6MIbSrDbgaqCfJsLCxRDgKQTiQ+Xfl
	iWjgIwxvthRZxEgyYh3MVlQucWbFGLT14VeM192NpfoBxEmfkvHiAwY+VG0XYRGNruokBg+MFyt
	zwss4H3PcOCycTZzDAM6dkNzVmMP78MMXEjfwcChODJtxE0wWqWM581ajE2KQVg9noGHYRle1Ms
	V+TsuMzyUg3xnqyHfBzjtE6zbKPSThfrCes2BG3CVFzNJNsIs0GGqVEBtGI2+gStoxhtFwHMTQG
	svUMPgfwnZKTBMs8WoTHoCI/SJK0v
X-Received: by 2002:a17:90b:2d91:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-395c39cd288mr10171064a91.14.1787308028069;
        Fri, 21 Aug 2026 03:27:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2d91:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-395c39cd288mr10170929a91.14.1787308027474;
        Fri, 21 Aug 2026 03:27:07 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm25859682eec.25.2026.08.21.03.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:27:07 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] usb: typec: ucsi: ccg: Add support for cypd6129/cypd6229
Date: Fri, 21 Aug 2026 15:56:51 +0530
Message-ID: <20260821-shikra-usb-dt-v7-apply-v2-2-030647f06285@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX0u+GhwJTT9iX
 ewgDYrJR9P6AZtw6eFbNeUpC2qCE24dnm0JOLc/tn2RP79nOzgk9H5dqa1BfBf6e5m9NAXkK4TF
 3n3GZXWQjU2QXsTUSkdrrYSjl9L2b7fUshOZFZrysB37HoAo6pIARRPoMMA/WZrefY5IozgaCqb
 ZkMDFnHosM+MKKB0tfjWvfyMJ/rK+2kMuWy98ELFlUZFBU05DXzcVs0mP6qBoOUiRkJxBWS63UJ
 l7eamuJgE8MkffHPEr+1MymVLgkm/4eK374zu2XN/E52SqdY3S1Oo350SBxCmxSlYejyoy7sWEI
 /esiKdO7JPDgo/2BxbsxFN9zmKnNyJHDKaISCvZW3fLoigBHa9M2mcGvufGVJN6gkea6EUo2Tep
 eu6UTQhe/wjTiCoaO5pjMN6/Nnpuk4UKPwm4eGoRuul3DC9LCBMfrS2jln+VYlis9VFZv6SaJuE
 96fr7lAyVV6ovvaWRdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX5zT9frggtXZg
 aINcL3WcyaGXIO0oGJ4mWZPdjtO+peL59NeKy8uOK2c+RtWhUqVUcUBhAazq8LKjpjZLEcJfC3+
 IOCdyeEGCu1LcdMoxjAq10bPzvScFEM=
X-Proofpoint-ORIG-GUID: 40zgPJK8ZhHqZ-Bqht30FmB5hWIf29Pb
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a8827fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5ttfkXOUkHmYICtgt44A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 40zgPJK8ZhHqZ-Bqht30FmB5hWIf29Pb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210078

Add cypd6129 and cypd6229 compatible strings to the of_device_id
match table so the driver binds to boards describing these Cypress
PD controllers in their device tree. No other driver changes are
needed since the chip is accessed through the same generic UCSI/HPI
I2C register protocol as the existing cypd4226 support.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index d46ca942026e..37b96d662e59 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1527,6 +1527,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);

-- 
2.43.0

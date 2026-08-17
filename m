Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C843F085
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786999834; cv=none; b=WFUqQ3YipnB7sIGbixG8jA0WXDAM8fEGlmpS0WBgGNl3rG9q+rp7sCwp9PdhoRnSaeZ/yDrUqQmIUfWyb0GIpBxNkZbGljPeEFDaB6Fxr+duCGJBy2p746sOhJ/b1IpqBlyfULSXK98xPDcYC1hIcXl82TppQZryiIlOGlrUlP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786999834; c=relaxed/simple;
	bh=3Chvi1N5F4Fv2g0WuEnztNmxkFmKs0u5U5hhZQi8es4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pKT6n+JvK9d/7mVJJba0qzfrOJkMYyL2xqicZzXkJ8QNkA8ci+0O16oWKAyr50KQFjRW+zfZo25cYOqgXdNXUIzAhdp6cz4SzFcR3vYbBRJnEESWfwhAcsnZ0DBDFgH4OSaIYU/ssUzvTKRfPkM9V8ZtbCst/iECVUxndFlq3Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkE7kNDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPpi3teY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkE7kNDa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPpi3teY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIQjD93107917
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EriltiZToSqI0mR1wtMW/e6wd0hN79nRwf6
	7Go8ixTI=; b=MkE7kNDaPD+YrGuv0picGVrJCilWY+tgq+QCUQFm4YuzhvpkDQS
	8y67VvgkBy5Fm/wIsgw/iIzvSPNR1xZ4XeTDpxisgKDIyLre3JoFCRtLDqO15YY9
	EEKGcgWWAVoK5x3TpAKEbGZLBRFnzV7aM/7O4P6Qeh9DBbyjcyV6eCJvdSYcz2+7
	EGVyP7Sv7uiTSNvajsP777l5ssK63eKjs7S1GAt3nkozJoTv//rRze67qg/m3OIq
	HHUHj4lpTSa9n2GdbqinVLGc5UDod5J07gxacnskY9u91e6YDSmtYiz6jpeS4fhM
	X1dyALmyTGaz+9cO2ywBqK+cfdQKNuGKEaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615gxsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:50:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so443098485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786999819; x=1787604619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EriltiZToSqI0mR1wtMW/e6wd0hN79nRwf67Go8ixTI=;
        b=NPpi3teYaBZIux+Mb7bGIKtRD3WugG1ojh99KiaDSzXlLUkUXTy3m2Hh1UkCE4NNH4
         k6QBLgXwupHbkBG2flcfnZVmbcSeUu8zPdmf/iccGks4OrBcIetC7a0o4DcNdsY0D9Mf
         xwelKakxtjOE67HjgnvUWpJVmsfUqL8MotBiHFTmqN9m9ZmynAnqWgEqoaCh+T8maDuz
         VAWJIwuYUpNU2A0ExGUDXrB0YBT/QgEN6DsvPD5WFqm8vOZ16FuIz/WI7nLyoCJJx3NC
         GjHBGiQ69dIvSJNBHW5fmORCmWQdMX4bvjfpfsGwUHyq5zLOmMg8X1TtBwKqkA7LUG14
         6WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786999819; x=1787604619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EriltiZToSqI0mR1wtMW/e6wd0hN79nRwf67Go8ixTI=;
        b=Fv+Z0ThUDzd71s1tHASZpLHLVG9UssWdXbw1ub1cBMMxgxsEzVRTOOwN9WTIFozrtv
         sJI1hv+cU1TrqmbAoqNHS37F88pYTxNIT+nUjtTBWOPcAG+sUVxg+e4H89nfkIMs/NmB
         rANvo1J5/NcjS/NYVmA7SKlbqamDCRonpQFUY0hbCL9Zxzb4ZkhjZ3VFMR6qDilX6Lsa
         rWisUo2OY7HdFEbXqqohZZq9hD9OWnoqCU6qs80q1ZU0m6ZRl5CZGCK14GOhUB8sbgS3
         m0dmbf6TII0O7aezcK4eccVddg+ColXeg1LdbbTCP+zo27M5mV9J1bXaKyjgRNPw5bqU
         chwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKZBj/3xZEzkU7r0wY6Z+nOZZffFcMVB8jf67+5lez5j3yojiGHkw0L0Di4EWu0zsRfJl33NWavaxawEYu@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEY37QBfGIK1p39YCorkPkIerNVi6VukFGdzmF2cN7NK04bTU
	2GrtjtEGaefD7zRlcGevyPLPqk62UzF5yrkTMkMsJLASj60FL3fkNXdNJgJepKjIDPjb8mQwCNH
	SA3BDIhwtNm9sHq893B4JiuAqtdfLmWh1z1DtOHf3O8iIPYF3ejMhhcbbDvej/osxQHc3KxPST3
	WY
X-Gm-Gg: AR+sD13ohtBkt3NV0wWDAF9G31sPerZF8UzyBYMASRg6yHTu7mGQq4l8bp4Wn3F5d1H
	5iwC7L6amOMecvM9xXeZQVXOgOIq479HfqnSnm9nRQ8IzcFCDn+tik0Bs24dndB0Cdf5urjAPgE
	5JQQDwirnEznKDT76sz5u9nqO0y04NFXhQkfgX6ImnsBJHFfrZFsT51jNJuV9ybIL+wnag047Jv
	QGfJkF9TF5p4+BddSj05bG7Lq2OlGFTcCvTN4o7CHbGmJ18LUK99bks8mGLpOM/0M2lyDH5EyMu
	hKyZ1p5ncyYwodx87Qfg8bpB8TdOLvzOPnE36G0HdcSi7y+/H19bsVsDeV1DZNGIuuQEmzDPBY3
	tkqKDOadUOHOc0pfuMCtYn2KEnoCmzgthvg+tvCA294NBcBQ9eJ3IbXm6ojxW1OPJm3MYTCgE6R
	FHxHElcDNru8BNajc=
X-Received: by 2002:a05:620a:f06:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93704b7d4dfmr376259485a.27.1786999819555;
        Mon, 17 Aug 2026 13:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:f06:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93704b7d4dfmr376256185a.27.1786999819120;
        Mon, 17 Aug 2026 13:50:19 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe7b854sm101745866b.4.2026.08.17.13.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 13:50:18 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: hci_core: Return -ENOMEM when the sent_cmd clone fails
Date: Mon, 17 Aug 2026 22:50:16 +0200
Message-ID: <20260817205017.56524-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5jM5pqGdGzffYNI6I6hUocMTgTXH99ZY
X-Proofpoint-ORIG-GUID: 5jM5pqGdGzffYNI6I6hUocMTgTXH99ZY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE1OSBTYWx0ZWRfX+Q0yKzlXttim
 cZyCz5Wqtb1et6eQoj6nP20JcBafRL1h+FALE0Rt6a5Ck1o/99VRXWGWm+ifOWrUu8BAYJtibsd
 FgM7EbKjcLuiNSH/VjpsyDjJuWxuZPgfmBHQ+gUCUbx2Z/HvzEPBPOtBIieHqvJMX5be0VaOAlq
 EYNrQ6222dYOdx41UEnfs8HNcnCGga9o7WOlanazzMg44ifqwSbVRhZeShTZid5fWazjGQJtsMU
 OH9T3snVXPFebnAlfuBUivDMYaLdjRZ0OP7T66I3563rNNbkqJ4HXx8ngM9m9D/EkXdeHwTDXsD
 nKf8OEbum1u84W9QOcjYYuWFoW4ICB1S+Hp7EQblwTFp8wI2vcGsnxAUeB2/CUKuhoCDGn709ww
 4mnl1i73lR6br+lxUv4Kpa9BT2CORT1r5O/FnvugKInw8hL4ns5RZDIBbFfKDMHAmCr3rfuuazF
 UKfCDMd6g05QXJxj28g==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a83740c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=DlbCxbnm00ezU7UVFbEA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE1OSBTYWx0ZWRfX0+eI7busbjnG
 twWBfb9WIMyJJIkLW2tHXwqdg4dwDvqmmmW5itGADWFqlfsXmgXUikIPhS+OyOLOhRpfKhexu18
 bcUUxnG9eAp5zufMvcQNMb3TbuC0CVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170159

From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>

hci_send_cmd_sync() returns -EINVAL when skb_clone() fails for sent_cmd,
which describes an invalid argument rather than an allocation failure.

Return -ENOMEM instead. The only caller, hci_cmd_work(), tests the result
for zero, so there is no functional change.

Signed-off-by: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 net/bluetooth/hci_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 5ba9fe8261ec..8aeb3024428b 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4073,7 +4073,7 @@ static int hci_send_cmd_sync(struct hci_dev *hdev, struct sk_buff *skb)
 	if (!hdev->sent_cmd) {
 		skb_queue_head(&hdev->cmd_q, skb);
 		queue_work(hdev->workqueue, &hdev->cmd_work);
-		return -EINVAL;
+		return -ENOMEM;
 	}
 
 	if (hci_skb_opcode(skb) != HCI_OP_NOP) {
-- 
2.55.0


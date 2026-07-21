Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7E3478859
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628895; cv=none; b=B4rQNCc9JR5CO1RAq6NFWhEzC0MZ/gHXavBc0ZGddiflCSAiZdPL7vPQN6xSaTttMxyUEPCuarqBtITU2XoH1yclbS4FQDntpparjkSAQOmcm2Itcb18n3qmTmrHTTPRAwsRkhyysWTtE7gzvIIlIB9P0eM/DAEPyeVlrJYOBjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628895; c=relaxed/simple;
	bh=aLBrQpVc3NpMulD1PFp4q1j8NiDItnsuDggSGFg1GKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVutml6Pt4HlFnFxG3FgbnvkCJTMikJCTM+Ijt+LFiZswnYaQ/RGxTpgUWWhReXnAO9GOVYvA5C60hNCukKpY1X4/ha5kyQK3CSXEQ6QW9Y2R4hACSNelwaGri7lCaEhVgLJZ5N/JYa25aMh3J0optd3Nebsi+JtO+rH3OZ5wJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWYUfBmv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKSh6dm0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWYUfBmv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKSh6dm0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L85Idv043563
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7BTdIi+zh96oXn04/dXzHRMysPQh1wnlTMmkfj/+b0=; b=oWYUfBmv4F0Go0dZ
	P0TlEHafVhB7FBhvHMo7TJqu+qMzYBzF4lzMxH2dhVZ/SIePC0FkorFwyr8mCzAb
	X3SLTthB6zqURWDqiUzJ9AJbcn05XYQV+SE1tdJ4V/6oGzcFjNTF4gOvlfAdyQYr
	DjrHkExiS1ImLes1MgBN0ijCgct3ij/CgDkZD/vtZ33ZgulS5VHoWqvwp1Tt1oEk
	IvCsCwLjVBJobr6dXFTRteWFEd1DKZ64VbPgojhGlCEAt63ROqlLnBOQyC8vojgf
	3FE8Xms1n3yksNKMk4qRCeaq1DgWrNS0rEKL5jhSQJl7na/m90gX9JjpL/hxznnF
	1WR8xw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as21e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:14:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc98d6a88bso37343405ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784628891; x=1785233691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7BTdIi+zh96oXn04/dXzHRMysPQh1wnlTMmkfj/+b0=;
        b=MKSh6dm0dYD2KIGXZ9fm4TlzFrQcp7eQKXJwdS+qUNXE/u2hsNniupKR+BCNQ5i6iz
         T88Dcs229AXrX5Ep1LelMh9/MjF2ghZUe3Ngo715z1xCrUYoROQeYxSVRNOzufYdc2q8
         +925Ov7IDKWxoppEecZKXci4fUkWStuwDzSoSYsgaS3tpoa8fKqTp1bP3OgHVBwPz9Bn
         LxCgd5VWOXQ2eaG5g6WbHu+XMRNRUGcFZl26u7IyHcXNzI1cuZk4QbtAg8/O9Fd7jBDU
         u7Ijs+1o1ZIFoxVn5ABsGAxtTagXPqkg3zIP7WzMmiXF9dZUe1CAv9cH2Qb3foQuIZHC
         7m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628891; x=1785233691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7BTdIi+zh96oXn04/dXzHRMysPQh1wnlTMmkfj/+b0=;
        b=AweRB/b2bbfDzYaEgRhkuhgrPqkW1H2yv19S36sK3HL2mPijNuyDfNnZPbXuDQCSnw
         +wK3VrH7o/LzKo1O0rGxtsPK2J44LhwCc3iZuS6bd80ysvqftidS4BJrGWKCLqDOmQ9h
         raYnCSrUeDFWDZCFsR3AkAzrATca9oB36xlRXp6pznsd2MMVhRgzvEG5fRLwJ6gQa0y6
         bumwzrkVhJlIRHNqndEvmf0+wVS/v2DnWQUS7BHsdmGa3WgeID5z/Y5Ut0BC/UaoAjk/
         Lx0JifD9lR+o2CHT472laKtDHqaGduUwkSYoV3/2eKgR8Bc0NEDdIcQTb0RIVAhBswxU
         OcyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5RmRbwerEsDxdYvUXNy8WHZ4w0NaltGcXYcq/CnyatVAcqNCw6uL0iR9/+feaj82MKXUJ95S9qnsgy2OD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/9P1EqOuDTSEAnFnp/xwGqu8c5KQkmE37tvE5MO8+t8gZbYwt
	2Q27xA8sdI5m3IeEtowjSw9XfIiAN0CQykfJMjAksx4sWlFdBckXY7Ckgb6HcUO7AHNSsIW2WFQ
	FK39yPhT2P3i75xcJTmhrw0PNtj2lLONoPAC9dZoPG6CTADiUtuurtReuG30sp94R1I9F
X-Gm-Gg: AR+sD118vNsxRANn4UZrTfhCsL7gUr/vuSQpta6iWfvxfpmCGCzOY+tfLHINdvmnI9z
	whNlIUGksJliCz0D7W+xJy9nfbsB6lsNt7wVGR6JUJ5amk11xtpUr1/7LQIhNbu9g/hmvdQ4xyu
	Lm80nJG6jFTc4FdewCwOlKPlR2RpPLA4hpg2LO+bb02JWl2ShkPFUii1QEhUp92eFc9nrlHLXSQ
	cobVQiWCUOemEsdQ7EngIb1gNksCKS0d6qQeEwW3X89D2KllhsTn3tMVX8G3C3MXCBZpVEJXkkN
	wp47TYzwVdPyI/0t7l5NAfBAs0sLXcG88kBu5NQXc1H4SxVA1DxCovEiNT2Tf4W5yPbGDZtN4iR
	JUJ9PyVyngqUf55AiIQeVfvfHBUDytd2T5BJXggj8bra84NU=
X-Received: by 2002:a17:903:3bc8:b0:2c9:d8c6:1db3 with SMTP id d9443c01a7336-2cf80587599mr22627885ad.8.1784628890823;
        Tue, 21 Jul 2026 03:14:50 -0700 (PDT)
X-Received: by 2002:a17:903:3bc8:b0:2c9:d8c6:1db3 with SMTP id d9443c01a7336-2cf80587599mr22627625ad.8.1784628890434;
        Tue, 21 Jul 2026 03:14:50 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf342e3a8esm73812555ad.0.2026.07.21.03.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:14:50 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 03:14:40 -0700
Subject: [PATCH v2 1/3] Bluetooth: hci_qca: Replace HCI_VENDOR_PKT usage
 with HCI_EV_VENDOR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-fix_vendor-v2-1-1977a8c39708@oss.qualcomm.com>
References: <20260721-fix_vendor-v2-0-1977a8c39708@oss.qualcomm.com>
In-Reply-To: <20260721-fix_vendor-v2-0-1977a8c39708@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwOCBTYWx0ZWRfX7IFPa6Y5wet1
 510OxZcgOlIuAuue5tZZkKlB5Nq7RRKCsshufomzIIEzwCSpsj2mmImfT4no/e4EdEPXOKGRdWu
 RzzQ5kj39LT8aU3JuC/6tvGOwguVqIyjJ4LLbRGSMOVV7Sbj0TzjT+f/D9d1j8Uj3eHUM+1YUdM
 pU5mYE5/+JkpiA5S55YMfZ0cCZ1vZ6hXqF9nphjqBPEo/nzNbGUbwLXvl+GFTCLGSq/k9H5R26Y
 2ZPtgSGwQpFVwLS9knmxOwJA2gMgjduam548c5RX+OWX7YaKPwQqMJreiZ6hofZpDcXsRuaIU7J
 e4uwyaz1k/cOC+jjkKQGQYy/6qFKQlM/KX52cA1tZtmwlYvLRkReFMWEgm0lExOVQDZXnVKAGVN
 BN9Xuv3rc5/dV7J3uW/tavofDBuymeHN1QViFgFx61k5UHL26hyNlQ5VUrM00wJbOucf3LBVHOF
 9bXEv8qIweJBYKQFjFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwOCBTYWx0ZWRfX3iPphdp9fipI
 e2MmBpWDVyeugty2V0TLkAer9y2/UxncB8lc+Qkf2PQ5XgeNygrLBqHzcuZ0JAKDv+qvqQ9OnpQ
 PmsFQHsWRFmTfKVIpR7ZneHXvyh+7BE=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f469b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SK-ELO-gduZh6qpZz3UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: OGx53NG02XoA23dB9JaD6XoDeRxvF39R
X-Proofpoint-ORIG-GUID: OGx53NG02XoA23dB9JaD6XoDeRxvF39R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210108

The macros below have different meanings even though they share the
same value 0xff:

  HCI_VENDOR_PKT: HCI packet indicator or type
  HCI_EV_VENDOR:  event code of a VSE

This usage of HCI_VENDOR_PKT is wrongly checking an event code.

Fix by using HCI_EV_VENDOR for event code.
Also fix warning "CHECK: Unnecessary parentheses around comparison"
given by checkpatch.pl.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index bd29d422c209..f978087612ee 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1240,8 +1240,8 @@ static int qca_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	 * received we store dump into a file before closing hci. This
 	 * dump will help in triaging the issues.
 	 */
-	if ((skb->data[0] == HCI_VENDOR_PKT) &&
-	    (get_unaligned_be16(skb->data + 2) == QCA_SSR_DUMP_HANDLE))
+	if (skb->data[0] == HCI_EV_VENDOR &&
+	    get_unaligned_be16(skb->data + 2) == QCA_SSR_DUMP_HANDLE)
 		return qca_controller_memdump_event(hdev, skb);
 
 	return hci_recv_frame(hdev, skb);

-- 
2.34.1


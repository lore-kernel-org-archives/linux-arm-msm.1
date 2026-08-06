Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DF447ACEF
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027156; cv=none; b=tXVqfqZygb3x+R6hBVrKTUHHppRxzm+i3MiV1uVjiu+4TW6PBsGNHo2k4mKulcMY5f5wmCe1bFTPz4/EoBIKzlTwll3hSmTmWKgxGhOmcpSY8KoopcANSJUWlOL6/yYMgUiCahvTbB4sS2MhpFa8B3mHU6XIRMci9LUWmF/ru+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027156; c=relaxed/simple;
	bh=8FCfjPBXOgeSOCE9oMNfyVBDBWfxZtU2M5HiiMnr1BI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rtf46nNE7KkVPTcf6dpT5Ob6okOResa0B5bgqOaRb4f0M16y2a7kYi8HDYpdNvpO3UKkjIjdCuHtQHz3DXWXsQZlXqm4RwtT/GE6t9EXsKsENaTboUUTnOJV5BBmBR9iz2gYxWiQ0tbryV1GLYlZ1LIJneghJTL1a7bjr/LGY6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiS/BjLC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxpK1nvC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiS/BjLC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxpK1nvC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nevp1277839
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 14:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=; b=QiS/BjLC/B/ZEeVX
	leRVFOHaAJqMLNNOkf2Jz8C6MGNXVKN5Vf/0NWYe41lq8NiS1jJPAV3YsY3ZOUNs
	828C4l6IgPKiuUH9sVJXPZUZ085ZneGDG+p2OKNlHwsdG+fW41bKbCeQLr8hHJc3
	lKivAWR5nCfpgOhkRRH8A155NsVkGDA/oChU9txG0xMG/y0xq5MBWRurXXoTRIEF
	kyXUAFfO20Y98sbh8K3eRAvfb9xHes6C/yLXmWyqSRdhSJjVT6ki5NH3cBDLNPAl
	1w42y4alJ7hBsZ6gbmV5NPkMqY0IRRSxlgO9CsWyiGJa9+7r5nAehiEXA6VjAla5
	noHa+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuejr9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 14:39:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so21691731cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027151; x=1786631951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=KxpK1nvC3udKWFMjX710IHO95Mh9MzDbIabdjk6y0Q2dCuhRR7hfOuhRVLcHlEccTS
         BkrCXMlwjAU25hvgcXXHGX5BuTT5fGSewTdRnefx18uZPHUJY//Yp2KihXKV2E0c3Iwt
         nf8JRNW80jlgp7KO+wfGjjwKu8JvFV4K+5rZdsY3Qka87QPbDM1iwgb5D9AjHBt5wv+T
         ztENrCn2BHzrnS8aWj5Iz7U25u5PYRhV2MpAB51UNe4x3Rq52dLRqIvAXW7n/X84bqdd
         1FOH4BIKLbTknbqJl25Z3DKLvuIIy4MssuKX7OXvDI0SiOXrpr4CnME7uoUukUEd6AW4
         WtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027151; x=1786631951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+r+249nF6a2qrtXG3fwd0XKqhJprD40LYapJr4TU6o=;
        b=bwV07yQx8c9ss8RoIEaMy6//6CE0Z2x9j3lS3+OM29tPzc5BgYJ3grdWo+E6iP50Cg
         fWxXeuFVyeuv5CDdXu6YXet2Yp5GZG+zkbpnjVzxlqQld3kUqUgqPB1qDTl7zPXAZmLm
         TJbOq4xSdWV4kCJjl3rjzgIPuOEnjKikLUyEYv+wdidxeZm5cKKLBh0PFpFOGvMXQfnK
         zOO4vwjLsVzFsozkxpBQw1EIWQe9buLEifgqgnCLU/EhRa+2E+akWVMW9FYElonPhOWM
         8AGpd4Xzo0TXyjhBZWcv5t7ThtO/OI9w4epP/MvRSWG43AUP+gAv+UTpkcpcVWZ3j31t
         qTNQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1ZqYbPxVF+r6gGrPRVb4e6ywfWoxBgFIrV8aqsKR2TRUPJc4GEUhEpjWfQjZZHD1n+MdSmWtCNS+W5l7/@vger.kernel.org
X-Gm-Message-State: AOJu0YwZkYk+TV0xtGb9ItQpAbdGyt0JuAD7kzWhqACs/YZ+rkEOqQUC
	98661/RKfk3u2tHXnWwFhQyS9dMQpstmyzd+3DDKfKmlvuZEriFvweHmG4nocM+BizAsaJLqaZ5
	pD1foVEOsGa19lnCAkt9OJTGvlvpR/jAXnrg/uEFNZ02X5ptZAwAvr5oTr6VbUBCjca2x
X-Gm-Gg: AR+sD137HSzefKk7cIa6FPqYuYdVEkZterlm+XeAM/g/hgfVUAwX3N2Lz9CGgfrQvKv
	cKT1ZK4iECbXTg0ToY5LCBXNxFqR8rkjzbu1Meo6RHlgZv7Sj+t4Btt5HCLNHx+7ty8i2q7jNt/
	WvpYcMo/Xxe3ZcWMjX/gRrvax0yHTc42M1Isfe+s4r7DZwpvlewXaZEIUbf+3vL6qOGtoGtFwa3
	4R+3NW0Yg9exbKRqWxRAymnLEPCrJnAVoECx9GqWRWgGKOcw6h3nfCOb0HkmuY1WIS0BwCiw+2K
	4iMkK29NqmueuYr4FRqSwNWJrX8OO9pmoKyeNdbuLOhO6AYbiGW1kK5wfvtjcAcYtpysmqcNeAf
	iIrG9LNtJGLHW54RgRzr/45dMaadlqyiqtt9i41UppC7m+x4m4zJxzOI325w0yI/85ZT7OP+rXV
	6XBylB7+2KEKpfXUsqZGeUUQhrzV0LLwYYkJs7Tdn2NMUCoh83xg==
X-Received: by 2002:a05:622a:998:b0:51f:20e1:137f with SMTP id d75a77b69052e-52ce6035ce7mr175976321cf.19.1786027151203;
        Thu, 06 Aug 2026 07:39:11 -0700 (PDT)
X-Received: by 2002:a05:622a:998:b0:51f:20e1:137f with SMTP id d75a77b69052e-52ce6035ce7mr175975181cf.19.1786027150660;
        Thu, 06 Aug 2026 07:39:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:39:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:42 +0200
Subject: [PATCH v10 09/10] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-9-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a749c91 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HpSCpy0i6_qgT4mt94kbXt73qU7JKw6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX+yIlSqaTHVfs
 ayBA5LZkPKcTsJHUlGbz7YaMcK3HRXRYQkjxGDMw7jN+JIHnmZR7W0XR6nRxoPZO8JZsLRq5nVP
 23xJMYWjH4Fvo5mSJ5JNBqThl6mJ1B/2YMQUsahg+C0Wm+ww6/lig5viNQgLtHgvgAD3FCs4eY6
 PTZdGXFCI/YIDtIsTtbMe/xnF5aBzwGdZ27uX6dzdsza4kqAecAGkQgJi9q+fsmA0C2U/6/jFle
 fCB9yczf+1GvZv7NzpWcfOA6gcgNz4fpysVlVFAe8haK2D6jO7sJ++MwidZ/04L/cXle7jb91O+
 +Nvq8KvFdxGd4+eidjtKFj2p76eZB8kqOIg7xcu2SMa31R41Py6Ui5hNMlx+mLHa6cmNtWqJsY+
 La+6mrPhZHxviZW3FJNzqBG898qcrFywY96coAr09FgX7q7rDQbmpoHiK4J0MCwmR6/6tLX2YEl
 p6SeK54LVkGZR/G7n8A==
X-Proofpoint-ORIG-GUID: HpSCpy0i6_qgT4mt94kbXt73qU7JKw6d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX9xnp/MiWhQQa
 1p9s+k+WpowPoMeSBFamCkSgLYT4kbAF3fOvoNy8p9SqLBul5e5UGSJ1p8kpKersoqH5wejFlFi
 WYH24dPSx+aT4CaOdt+4i3s56h+BfK0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060114

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 04ebe290bc784ea854ec7743bc753c3e41f556d3..06cb787b0559f3d712ec2b88d9e25a7d46fb00b3 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -723,8 +723,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


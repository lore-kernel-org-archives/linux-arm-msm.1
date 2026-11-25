Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595927;
	b=cyMyVi2gpEJ/sV5VrLKC//B4FVYVNUzh1l/EwATWgrwlG1VW/um7FQratzBjaOe8JYmi
	 h2VOtydb/wUr2KFt8H/B8rILkgvS+kRmgRAo3Ik0QyFkG6pJfeeBkqKemAe1ial38szmo
	 CSDe5lAACcLjJc65q8rZGpKtwvdBf1Pyu+RaiQ+mkbrXWGGJ+2h5Nz245F4vgqSv+DH6K
	 eeyCfw75d/feWTevINN46poacmgkSO6HRuK+wKpL1bxHH+EOUZTQZzaAbUPMny8wmulgS
	 cg0x7oFcSYCFSYuJr3tfsVXxnsWg1LruBIlqVifZU8Bj2d6JvSF15XhqaKd0jOiiCOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=;
	b=wMcUACHfn7VfpCv3gm3JzrHOga19Lvgo8N1E7hCCXnvk3AsbvNf3yHlgcTlA/KCsji0E
	 HaE+XqSW1c0as6VwJZMV7o8/hI00htcawsgJrhgZfrvtJzz2GEgqBJBuCPmEf6sJAt4Z0
	 QIIIjag6MGNmButJQv8OUSAoHDJnQ6LLOFWmm6+c0Kfxd1EVR6pEYtwy++FYal35EsHNB
	 x+aToV3vsulIcCb3scmo4sU8KxKWsxGqWRktVBOHfcDqZerPT6fFhJ1x6+q+4rCAtGKIz
	 uBndPUYBM9C0kLFRHakkDXxJklBGXSV/3GgE44i8Z3WsaR8WupStSeOFFqc8tGxQq+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdfVQYu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQTsNpIj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3617F606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3617F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdfVQYu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQTsNpIj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP695E93114979
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=; b=kfdfVQYubP690LMM
	F3W7D6P6Jx5H6uGV2a3FkvZl9MIT5EbOL+uQEnDzn+zJC9ObIbvsMyTB4XsOlQLY
	Vljb1C1q21o2isKDgKInpKE5/bDxsCovHnPnmS3XE1eYtwEgqQCLIfPNN5GT5n4V
	PIRo2tDIsZuK1UDb9wP7dIkn0QzrIAPFAVz0a8d3ih1jjN2fb1gUapnVo6CZbZNv
	4RlDDCV6qMqsmWqwKVADpoMF4OCBBRUsp2PnjGpWZTbOWBSA3rUAzhHUagHaup0m
	gHOf7EUBwkQi115hUnul2cC1J1Gvi9NWajRgYVJi/moD0e9P8vGEByjqNf+D9NK6
	emA0MA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsamm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fcso948236685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595925; x=1796200725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=;
        b=EQTsNpIjOgL9Hanj9vFfi1kL0Y1PXhugpRW03zRLOCoh5s5EVq4IYw2rMxwwd+pdxK
         aHsVOUbr6/RjrCiXkqJ/SQhA8Os2qlUrGOY16hm0j7Rs8nE+gj3kBovzfoaot0GwDTyf
         dSOaPzQgjeSYxBRsg53YSezKedrCwG4WBWcDx5RTJ4EjCUgwgIEHJpRLYN0l9HO+lpQx
         BpB+FmIAftg5N7Re2XvnUQPp3AVLdcQAW+6lRNypcPkLxg57U7p2RiOUNg1M/KU2AdMe
         94F3O1WkUrc6l9qFKSgw/7Nakyg7glSgwpuCC6y0NL/3ebkAKJ7iN7m22G8yTyw3C5eu
         36nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595925; x=1796200725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=;
        b=bqTW/lxGX1XODW3amo1j665fBXyTtxaakKPAwORR5HG/moal1gsOWHqZz7swr+E+7o
         kWdUOeJk9jhoHnR6WCei8tD3q0h63KWa8E8XCoNbkeYpG8ZGvV5rmQkPmbv5faQyaLD/
         uAWTMcUX/6TkjfWo+qXwAUssj27G1iS0+GxQfIddlaxagOkYJ8LaxZzWfBGyKB8wmxz9
         yjP+S6UKEwJucDnc0K+H7nQ3VrnMj5qtmg2TceYRIF1X0O7YyuZsOulkZ6eiUmCjHCVh
         gUwHpSsOLaZ4Nacfds5yRplqXfUAnkXzhaYRhO4U4uz1nKydI/kVSSUo8mgfjOdRnQOC
         nvzA==
X-Forwarded-Encrypted: i=1; AL+hErGMs5ElQXbj6AgFS8WpkBiJjDEt2zpVuBRAaSYdNYkdMmnMrklisPD3FlrZne4QTgNNSt1zWwO/yfo8Gyy0@vger.kernel.org
X-Gm-Message-State: APuU4Z9XbXPtWuTNMVGh0ZdnzA4319PxhhKOemlI0hjC9J9bnagu35pW
	XUl81lfbdC736mR6uitMN2CzhVx66qlBxph8EkDaqMV9wrZ+nXgVVLzaMxXSsvCcO74KfisTz+Y
	3lkkJ2fGUEWZ2/XW92OKq5jQ1Upf7yBSS/5YJkm8MNXhNJovrv5blxXXSoWYBsb5CAOP3
X-Gm-Gg: AZFdTZeVRd/98aK92vpTMJDz/MlpLWrfo6ZGQR+1MIdLusQC/h/S6Le9qs2Lh6RVM8/
	VVQoe55hrQiU6buvC02Vgq9t6eNrY12sl3tyviuIRd43O+h4/jmmPyXKCuK6nmB3o22BMnZWYIG
	xdYS9D1levmyMKIbmzlwQP4yUZxwSJ+JcEM+m9CEq6SbQad92YPnafOxLYkH+qykag8J01RvVCI
	WHx72zLTAY6nSHwFS02eFkfCS12mBdiBwc9LS9EYbGv3pWty07IwjLwJ8VerI5gJY4yNAUMhyZo
	lC6sZWXkGJAm7T9xJfRriWWpIQqmpeYj7ikVV/Uc2phkd5Td0EZNu0pdoRF6Db8sYBm15A0aDhO
	tw/5bzy8U/Ah5Nn9f4vPEvgDKet3wH2jlvozMBFdifRP6Be118M7rAbIw5f2Evf472QXgaSfGlO
	YPMvN5MMxAWHroZ7sIRD/E4bzGZhqoRxwkQ2HRvsWMPMu8cRfpf7F/iKDruiMbESSuM9o3ydQ2U
	bngBd3nFMmpVQcdHLGdRyXvX+Dt
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2965155585a.42.1795595925401;
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2965152185a.42.1795595924856;
        Wed, 25 Nov 2026 00:38:44 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm24626021f8f.15.2026.11.25.00.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:38:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 09:38:40 +0100
Subject: [PATCH v2 1/2] media: qcom: camss: Latch buffer addresses through
 a single helper
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
Message-Id: <20261125-tfe-fix-irq-v2-1-29dfa0955927@oss.qualcomm.com>
References: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
In-Reply-To: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: QbIdf-Kgkf-IDZXMijXx-Hp7CCtHdyO8
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b069e96 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXz111TFxNH6ro
 ooX+0l5quRPkg/fuJLbxCOeJGvipqfcq1Dw34d5MjuFaZBYCfrXtVZH8LWqojw+5TVll2k64JTj
 IKy2df2zSa9gUd/+XnWgEhb8SfFybfk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXwsAGUY1jVAZW
 EuKSB7JvCpULXLREBCWbhO6fN6TUMKcaejwfRCorx0ptl4GoJCWcXwshQdjIquAQ+AkZVz4PS8x
 8LxS598TmHzp/LYYpLLjiblLC12MSplWZSdH/5kP2riHRdxqnP7Tzed3D5/kMY5ZxuIswI0MUw+
 WHpgFcafYLRiC+Eu9WeYs5LweB5kcWIOOnNwaxd2+Hvm864Xj84/Gt5u5mQqs5v/SE5DU2BgLFN
 lJ/jDqQSsa1fCtyYqLwU9/cyreUE994uhUl+3H7VnPpWK/yRfpZygd1gudqipodyOJpgwi+onff
 gzsJgYI6UMTMyxoMB+RmXaRE2bDrOIm4vllfg2Dw0oqvLlNMFRcd3btEyBb2YiWq6vivNa06Qud
 Iy0Nh6yULYOVntsmaZbwJH4PEinETRwRTtPoGtTnvN/GF/JAQUp7HZaHQuDlpUFiOueT4AmMI9s
 8dti18rQEnnMv2rWxmg==
X-Proofpoint-ORIG-GUID: QbIdf-Kgkf-IDZXMijXx-Hp7CCtHdyO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

Factor the buffer address latching open-coded at the three call sites
into vfe_buf_addr_latch(), which calls the generation's addr_update()
when it provides one and falls back to reg_update() otherwise. The
write master configuration programmed by vfe_wm_start() still needs
committing, so vfe_enable_output_v2() now issues a single register
update after buffers latching.

Tested-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com> # SM8750
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 33 ++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..f39e1f303c9bb64a41c59d0d413608b5cb54a8ed 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -443,6 +443,25 @@ u32 vfe_hw_version(struct vfe_device *vfe)
 	return hw_version;
 }
 
+/*
+ * vfe_buf_addr_latch - Latch a newly programmed buffer address
+ * @vfe: VFE Device
+ * @line: VFE line
+ *
+ * Make the address just written by vfe_wm_update() visible to the hardware,
+ * through a dedicated address update when the generation provides one, or
+ * through a register update otherwise.
+ */
+static void vfe_buf_addr_latch(struct vfe_device *vfe, struct vfe_line *line)
+{
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+
+	if (ops->addr_update)
+		ops->addr_update(vfe, line->id);
+	else
+		ops->reg_update(vfe, line->id);
+}
+
 /*
  * vfe_buf_done - Process write master done interrupt
  * @vfe: VFE Device
@@ -491,9 +510,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		output->gen2.active_num--;
 	}
@@ -564,10 +581,12 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		if (!ops->addr_update)
-			ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	}
 
+	/* Commit the write master configuration programmed above */
+	ops->reg_update(vfe, line->id);
+
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
 	return 0;
@@ -601,9 +620,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		vfe_buf_add_pending(output, buf);
 	}

-- 
2.34.1


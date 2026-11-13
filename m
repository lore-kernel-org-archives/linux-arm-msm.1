Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548043;
	b=ZdxsiJ3qCjNRYaMvyZutRCyUkdK2+3ej7I0omHprcf4q4Cf1dMRL/ugUFlWN0wQwigFp
	 c0IoL+T2PdNxkTbcwXW3NyoJptV8Io2if4a3t2AXqRSc2cEMSqBLIr4OrqBY5TtsYIuj1
	 77tm4KvIQecQxtY4geH/vt8GdRb3kifk6M3uWFsED0g6WB8TxuxgEuOUVyWFl/nmnSVzW
	 DVxvBcJ5+ZQnKv/MS6MFYhWQk7vskKJFO/hFcgyw3vzO3btIaWgqku8SM4k0T7yMgs/1E
	 KWJm2B+wZkuA59hi1yz0YLpL1w3UjWYejxje0hlllM+HNryiAry8w67bkp3InOsgylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3GeqCA54k1HDJk02yNBmeCcl7EY5TbaI/8Y2GXSOGlI=;
	b=dUz+vFgOQXFHFsXpCaBtMs0STHsh4GUk8b22TOsRQ3pENBk4TOYgPZJ5hxkuLeXiVEsd
	 Hz/SKxGQtQfcKrX6Gbmwc7luzSeebLsZEDKdsjsvVUjfeZD4z3h0MAzRwujSR2+7ugVPv
	 +xX99bAvDD7VHQZJjtP012n3a8c8sPIVNS3qJx4LIM1q4+mAk/PVbqq5vX7cwVArvKuOw
	 13x06nxJJWeXSr3+MNc6X6DSDG+DrK9niFOFPqnFXH8BR7BRRip7e79UYGVvD0wKYugBf
	 7327wWFQpgxbnF7BkMGdPx7avQZN/WCEFkv85Owz6DPoh2isp5bAEetqvYid5prF06A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lMUQp9eN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kph5yZzW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493B360A2620
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493B360A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lMUQp9eN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kph5yZzW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57ZHg3616415
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GeqCA54k1HDJk02yNBmeCcl7EY5TbaI/8Y2GXSOGlI=; b=lMUQp9eNOOiSx0LA
	RtcG44Asgna7uty8EBNJaAquk3523ltxDXQ+K+xtSPNlEdn/maE6e37+ZhiqgOJf
	1FDrMuzEdhCCh4K4F3Pk7tp3sJdDuozu2vB/mq2i6fIcdcdmR4IOgMJrjL2V2iog
	NBJBgLG4y1Ajw+lE38jzkShKZW/9X26FI59qXgAa1fTYVOXqRFjr0xu9mQFhfX7I
	uWVg8iPgthO762+WecURKrx9mhvifntjbh21jogbYgNjubsij5irAkELIS0cCIac
	t0rxpAupLnOtA9ZPiLfQaKGLHCaKW5Rde0/t4I3QeKcS+/kraunsv0lYSJijOea7
	VVTWOw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0aja3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:02 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6dd94f8fa25so591610eaf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548041; x=1795152841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GeqCA54k1HDJk02yNBmeCcl7EY5TbaI/8Y2GXSOGlI=;
        b=kph5yZzWleXFquSI/qGpi2S+z4zHEx6xpvvzqC65zMgoRu3spGjMz9fJdIzgih3VTy
         CiDOV42+SbxfLumsPTcd8ojO3B+7e/I+csEIhWlaf6Z7WVR3EJA4dvrEKVBEFvDqtQju
         gBjTjasW5aXHeSsS5RBT7WBa9L+Iqh7Ajsn8D3ZdS5wf83QxJUTjZhqzx+IUGelK4iH9
         Qm53kPwz7yq7uROEcC5kPIhtjZ6mmhWHgZTqKCvBhQ2cjabKvnNOVwzznRqHTHFFlvrw
         0Xk55kjhsBy+EpBOm7jaRIVpjePzj9S/hBgEJKw2PHiCJdNUqMAxVp/K4iboOUyZKRCN
         yfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548041; x=1795152841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GeqCA54k1HDJk02yNBmeCcl7EY5TbaI/8Y2GXSOGlI=;
        b=mi1P9cknp+DYrseINvjYbEN9jFRIvzUi6wgrHjGCFlYq+LMPXajwTN+nkhP/CARo4x
         v21PimosdqVGc5/vyPKIfooJz5b9sXw32yKd1p+W3CNr9RUvwZ1Le4BFKrQiG9jE0d7c
         dVebpvgeOSeKzitjuttvdpzfr94+ohiEHZRwpbU4Z2ZmzR8dpXG/5nR0itq/CBHqO1l9
         9nWY3krNRKpC0VN7OWABaTl3cVDzLagnUsT8tPaiHnSyGd3GjqRPnQlEkTaQ4XtStZ0S
         TjapCH3zDtUnSJYRsMJfDnpvMFg8WF3MR8Y9uHB6fB8OJYILI+PcvoNgyczwy01UIZ9I
         07Ew==
X-Forwarded-Encrypted: i=1; AL+hErGGQr7nsKiPeIJ0aqkuGsLjZAawvofstNQf+VvOj3tTiue952IyQ3kR3uy+7jtU2Y3fy+ACck6EFMYxNpxp@vger.kernel.org
X-Gm-Message-State: APuU4Z91SEIuiMzI0DtTS/lDrdZK+unAO0xfNFQcMYfhd6SkpVoCobYN
	AtXts8lDpSZ4NnoclMuZv1xB+gyDVaI2xOzRG81mW0KGsqxl1VpoLTSavBDCHqjINNvha5p2K0y
	DraoFHmRc1R5AcDalThSZq7IdXcQemclrNbXDyrz7DAoJJDz1NeDopP5K5ua10H2qAt1g
X-Gm-Gg: AYBFou0rwkcSOxvuZWpE5AGdMwRtEUvdQOGk1+AZAardmLnmWIlevwpaO1eZVUKiPUY
	d3z2TdvTmqVn1VuYK6AvfjmUQDvytZXAAMlHjO/0zXHzESodfHLBgOcn4v2vu7o6RQInIbwShcX
	uqVaDnvvNAE3kDrOKRNS4zJNFOO3wNY3VISOaeF8A4Dq7dnsKdYO4SKBJeNnfISk7xyL/c+BrE0
	Ky3zaU/QRf2vOW1W0o2ZKtNzhuyu2/qJNmvryDNoYE90bdfM9ORME1crJvfSNFjgJVlo0yKlvpP
	OlhVmhtEQzTliEZeJ8JWebRhGPn2LQtdoeh4Iw/87GCYj1G1nKLXtpJpQhSS3SjOB85AGq/fQy0
	pT9aigpZub1K95ZKEGeWlK+hd9gXHQx4S4tL9+1SXDIXqZhD1wC30ErYU73dwFw9WHnozAUZWxz
	BNllNNhT1JPCGUpFM1EgWdUMMwzgom9aQItlwLlfuC+Gb3KSMHN1V46oFwtZin
X-Received: by 2002:a05:6820:f007:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-71ab4cd8533mr939900eaf.13.1794548041380;
        Thu, 12 Nov 2026 21:34:01 -0800 (PST)
X-Received: by 2002:a05:6820:f007:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-71ab4cd8533mr939885eaf.13.1794548040890;
        Thu, 12 Nov 2026 21:34:00 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:00 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:36 -0800
Subject: [PATCH v25 04/15] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
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
Message-Id: <20261112-kaanapali-camss-v25-4-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX6kZbfVLm4Puy
 drs7yTttxebsAQmy4oNJPiUa1Adl9Vm+/du2v8BG/qsSiaLUcTjzOXnTPNz8IIdng65Wc83FjO9
 0hyxcgYZj2FBbXTAl+hiVVnoL6mGTmI=
X-Proofpoint-GUID: 5QEsikA0aNMtUrMMByQdjkQrzuMzbeFa
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6a14a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX+pxEqLfaWhc/
 7BZMFPUfGZMLJVrsJy/h56n2tHJHMQkTb/OtYlIS076HwVHZ5ZbfsLN27JAs5q4zMd8o+XXWmO5
 rj3YAF4DbJJZv7QITtBdw/1gexsAes5MAgjJOJFc4VtQSYz4a8ZnXyloao/KSzyHSdU4cTz0W6X
 H28UMbsigRCeNX5oEmizS7CrsDlC0pd/pWGa6jire58MRnWAI4Cboa11Llz3rrQg+jwG/7nvzB6
 ISgjNw3ahLN2V74J+b6f6a+7qGLnIQgriC8h2xW2CFkh/dbkIUpA0cwVNZp1jrRIXVZ4iVVEjtS
 yHhBtjsLQ6z6q9YAUQmvhOQ0badYu3467wrwvnmV/SWcmUyJasS8zYtEZ2s7eQDHZVMGtDis4FT
 L47s6jhFfdWlEGK0orZ46w3nlxigWtS5qsyjoRriC8kn1Nwa4oQNY+cfhuMjdrYlVvRwWbRfqVy
 4q2W/0AxtTsnPlTV0PA==
X-Proofpoint-ORIG-GUID: 5QEsikA0aNMtUrMMByQdjkQrzuMzbeFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

From CSID 680 on, CAMIF was moved into the CSID and the CSID became
responsible for issuing RUP commands. Starting with CSID 980, RUP and
AUP are issued separately, and each command must have its corresponding
SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.

CSID 980 and newer require a specific stream-on sequence. After the RX
is configured and before the RDI path is enabled, the CSID must first
issue an AUP and then a RUP. A RUP issued before that point would leave
the VFE without a BUF_DONE event. Therefore, once addr_update is set,
the VFE must skip the initial RUP during stream-on.

Add addr_update hooks and camss_addr_update, and make camss_reg_update
handle a missing callback safely. The VFE keeps issuing its initial RUP
during stream-on and behavior is unchanged if nullify addr_update. The
skip takes effect once a generation that sets addr_update is enabled.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.h |  8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c  |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
 drivers/media/platform/qcom/camss/camss.c      | 15 ++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h      |  2 ++
 5 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..2f7e593defed 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -137,6 +137,14 @@ struct csid_hw_ops {
 	 * @is_clear: Indicate if it is clearing reg update or setting reg update
 	 */
 	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
+
+	/*
+	 * addr_update - latch buffer address update through AUP
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing addr update or setting addr update
+	 */
+	void (*addr_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ad09593f5802..87bb6ef38af8 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -487,6 +487,8 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		output->gen2.active_num--;
@@ -525,6 +527,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
+	if (ops->addr_update_clear)
+		ops->addr_update_clear(vfe, line->id);
 	ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
@@ -552,7 +556,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+		if (!ops->addr_update)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -588,6 +593,8 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..8312e4c91e98 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -99,6 +99,9 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
+	void (*addr_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
+	void (*addr_update_clear)(struct vfe_device *vfe,
+				  enum vfe_line_id line_id);
 	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
 	u32 (*hw_version)(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3ff0..9521301ec972 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5047,7 +5047,20 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
 	if (hw_id < camss->res->csid_num) {
 		csid = &camss->csid[hw_id];
 
-		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+		if (csid->res->hw_ops->reg_update)
+			csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+	}
+}
+
+void camss_addr_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
+{
+	struct csid_device *csid;
+
+	if (hw_id < camss->res->csid_num) {
+		csid = &camss->csid[hw_id];
+
+		if (csid->res->hw_ops->addr_update)
+			csid->res->hw_ops->addr_update(csid, port_id, is_clear);
 	}
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..431afeb381aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -182,5 +182,7 @@ void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
+void camss_addr_update(struct camss *camss, int hw_id,
+		       int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */

-- 
2.34.1


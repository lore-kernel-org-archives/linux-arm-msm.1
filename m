Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616146;
	b=yGqmcDbMnLXHbhhjqWIzmfPCshvAR/5KTrtpwfe4OjXwBuS1ESoEM821uIDKKmy1DJG0
	 KDOPviKm+fVAV99lNm78huq/5MULIMmGJrVCf43zhJY2ffO11bTa3Gz2FrWoWn2z2q71q
	 xf30MooVz3baGMSkd3FPs+JOBsVlD4JX6d/C37JGIXSQ9+lvQ47o1f5wI/ahurSaOwXKR
	 rfz97FGGwmBkRe6qgfKqb+2vJr+zzxv0+GEnTCVpwgiimqTH/M3xZH1Yu7OqJ90feQZ/M
	 1osVUmcc3wVtHY8apjpInR+6AbEyVbl5tgfd/LhgNZY+qM3zA+FgoyikhQ311PzGaew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UjRg5ghNYVXD2NVWyWs3nDdXr/lQ+mTWIwgMVJIwbvg=;
	b=BFk6XXs/gHHJe4NH2hqeGU51Tt+Y2MKvS8DpArKS1XbkBwQ2UqpZ1Shs5F2DgU6T9+Lj
	 dhiLAtN3mem0I2mZdWFDv9iLYd9/KyTVp1C1TZcKaWnUyx4qXtHiFnjzXXvbZxqyXhxRr
	 bGUbUp5atP4ZQfNWtvjOn/4ofDQhYj20aBk0eiKpNIvdsxBPDYHeEC9ZGxtfgPwOA3djM
	 mFYwkKYzrYH9uGxEa/nWzBMuBah2oPKvaRthjzSz/eNxbnSb7mMuUjcx1pYi5K7Hv9xUm
	 WydA01P54WkeOKaxGzIOKgp7ye0XFNM/PEE9QV//J+6+cyI2haxnd/n5daA8gEK9Z6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZOBP9dz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YI3IHuZB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D67606A33C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D67606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZOBP9dz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YI3IHuZB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299vhA3402360
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjRg5ghNYVXD2NVWyWs3nDdXr/lQ+mTWIwgMVJIwbvg=; b=OZOBP9dz1Uprw3Uz
	iGGU+DTovVKnMMZjPiP7QTuIegNXkSdzHJdUWE84sxJKwCBacbxmEkj0pR2Oy/qa
	bJQZAr5+9C2SuPluYVFza7Bz692YqIFcjm51kkh24ptW6EvkTNSefExCQPjA9AYM
	5/TQ24J//zVjGWKiY3ABSTZRcFugbXKTaxZWgHX+bBtNeVgRYsNYbzFKkwzd0kJ9
	m8OA44ivnDnh2XPYtpc63Zg0IvZpoQ/hiUQj1hXz2nVx2sVB6wqmo0b2mSAl/sss
	Wi7oZpAfsiqAOXjzylfqDrIwbtEyqukS+qq5MZsfeks1B0QB2UNTNOa201QAa6Yn
	nT/QQQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8q0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:24 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dab94dc3e7so4358879b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616144; x=1794220944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjRg5ghNYVXD2NVWyWs3nDdXr/lQ+mTWIwgMVJIwbvg=;
        b=YI3IHuZBzP8LDPPV+otWnMVvYxsma4eKW7w+j47uLe0h0IBSB/xDofoLWMlFtVt8Ug
         N8l0iBLYoKB22oG6XopGf+8TaIHeybAeUrMEKOpdUgmNojE5msh4RKw5cDA5wsH3pMgj
         atWLfGeYtGX4lKMHjTuLG/kA9fXuVqq2B2dMSu27G9jzWVvRc//Z3XfUSxe+Cr7bIoa7
         KR8RJFg0M+4ptaS46cjFMZqn6rzIDTJRHxA+we0BfLOrEN1nftUmPt4GYLgQI9IOiqXr
         OcL6OxDZ1Q57NUWg2G+I6bc6ePaYuT4Amd4qh7fPXW7fpi6r+TmwbSUutZ2T1jN+huw5
         LDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616144; x=1794220944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjRg5ghNYVXD2NVWyWs3nDdXr/lQ+mTWIwgMVJIwbvg=;
        b=JCkkDBVOXNnxY0bubdpoBwTIbpmTDqtb3aPqFTwmdWNM2DRCcOXhdFz+ys9423xyFO
         M+nFfeLiccsfjIqDADRW80AYnxuIVWUz42IfFwciBMDzyM4F4ZIJmdXXURyjccad13wg
         9UjAYvOTAzDaRjDZECrwLIG2HEKj3RwKfTdxXLJJ3oJhr1ZyKT3OqMHhIjCVDKzbqp31
         xeh3wVQvhBvjLwGxANqJ+wedx23RxNODPMloKUpBX1mgwrJ0MvxmAbm6OhsN7/wrsrmc
         SggEF8uJclXkeyNsji89kpwT6UPLoRHzAdmOcaJQB49n0Vw6tuMHibUBuK4fJgTwD+yr
         wedw==
X-Forwarded-Encrypted: i=1; AKwUvBzvM+cYXouT1WY0bHP6fFjeXm+fN4kJA8JrjC0NrZi+nX5bTKw4FunD9xDV8Icr9umL2Nc7+2up4IoJEjBc@vger.kernel.org
X-Gm-Message-State: AFq9FYK199DdD97zW9mtpThi7JKuzpw3O7ZncWuhd0DoC1xzoc0C6AdF
	T4fPOm0DKqQC9APYUNwYfi33j8LqbkGATlhhx1ZdvpuyjXAtTGcI8I63xAtOa50YwyBEOEBayPN
	UGXIMC/KTz5wJIdb3LzDKi2ZqwcR/VNVxtJgc3V+3N/uvOTHsQKDVRq8MzCi12x+jbiZ4GDuMH1
	Fa8TE=
X-Gm-Gg: AYBFou0EQiQ1x+j6wlpeT6aLgckP4BdNfpdLiTUUSJRnsmZwT1aiyWtiW6bm/mvDbJs
	G0WvHfLAiAdEYbcHmuZXF5dI4V777MO5LMzD34NWggpuDSIdKwiN5x8OPVgEyLr+h5xFpXjpzDi
	JcXv1DssRrlecRvGaTHO8pPo3k7Jo3K51DTmutT8/HeexT1nWh88ISZ30AYM6ZbILYG11OZB2cM
	G13wZsGrF1dwyq6vm7/proU+rEHnaiR5llPIxQ9QfXQRnCdRKr25u0ZRPq1AXK60TJGRaQx2iT+
	hxSIEsC4WVWjCPQMLse+iQXc5moaTl+HwyU3/1xEeJ/VSm6+2nvNx0VrcMyzQFqJ4dEIvHEx9uP
	lKTBrpn4rsFCaPTRVBm2/+xBGYmX2vBorwqwkQy8+yz7uWAnLgKWvQ1s/jdOaXfYVK6T1C0bbTa
	4nVBT5w7c8wi3+AiIN4ejh4/uIcqboVWgt3KqdW7GpC3f9TXdooX9y2vNOWSE=
X-Received: by 2002:a05:6808:6413:b0:4eb:e665:bd01 with SMTP id 5614622812f47-5640de56ef7mr6709778b6e.34.1793616144039;
        Mon, 02 Nov 2026 02:42:24 -0800 (PST)
X-Received: by 2002:a05:6808:6413:b0:4eb:e665:bd01 with SMTP id 5614622812f47-5640de56ef7mr6709752b6e.34.1793616143545;
        Mon, 02 Nov 2026 02:42:23 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:23 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:12 -0800
Subject: [PATCH v24 04/15] media: qcom: camss: Add addr_update hooks and
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
Message-Id: <20261102-kaanapali-camss-v24-4-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae86910 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXyKAHHImqZzPZ
 lj8zLJ+9NvV4NdX5sQr8KXHLrQ2OMd7WzN++bizTIp9hgCBAJ2WRbrjHYxYRQQdKJlhpZUzeN9X
 MgjQxOnoXiTaHFP7MHNK1s/H3Ggd+SgNT+vjV6lr3cOVQ3H78WzCKaElY4fm5TqvlpXr8t44o3u
 JluIvL5eZYfozk+XdowDVt3aZMQE3KLHAmfvu5MbN/Cq0LzLAiZsGbMxK1bFSXEYUil8uPpkoq2
 vdexZpj+Yz+910sXtrWiATgW9mVdJeiC4nyb4uSJIO9rNGFgUbRMKWQ8d6CDWHT5uI7zMozHzVn
 EMzRoI7jBIQirmLVvar2chYnTAsgftBaSOTwtwg5jlQoZFxh4hzCzuDUay0nMpkZbCMj8dYzPW0
 OLdzXNg0ndUROa1N57hDdOi4qhyEKHX94/ZbW5pG3hE4etGOtTN4htM7bk1e+uxZF2ScOruity/
 LD1xXXgcsF7K8UwhLXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX4D1uVAVmG+M0
 Fk1vNsvYjEiMimn8N+aWMWWJwWk+0/4JUlwwNJUJ7jhvDA9eARJ5BTIc/SgWcCBQM16EznGvMKu
 dK4Hq3PP9R2pePjKneMBaORSF9dLdAg=
X-Proofpoint-ORIG-GUID: PHupkZtfGA_CvGw5IEGV0LzxY-c_4kBv
X-Proofpoint-GUID: PHupkZtfGA_CvGw5IEGV0LzxY-c_4kBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

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
index 2680a9914765..4f8867daea4c 100644
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
index c54185c93a8a..be58a39f4a8b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5049,7 +5049,20 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
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


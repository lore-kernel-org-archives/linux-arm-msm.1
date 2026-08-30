Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5990F2E737B
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064204; cv=none; b=nzOhpVDhqTlgEt30mBLOS1buezk5LvenNq6hbO9KP5WudXlm6ag9215X8spQk04y/clmQN6qEETKjcCgQDK+toByiR+fTEE4t+pmii3cllE1HfiUR9YrzO2DzmIM6QQ9OyqkrrmDy1W70hc/mdu5TlJGSe0IsmVyNyzCQz2tgY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064204; c=relaxed/simple;
	bh=gSbPk6PQOjTbDMU50WEy+eW/Dadr82jN0oB9jeV6KJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVFlTUHmz4QE5dw/JpKc7MCaKwfi2LysIlVdwIG1T9UKcBGr1pe1YwsL2oDRNZwH2jkwRMc+Pj1jqdO725KMHy0Ya4QP6z1V7B8t/Yqxa68eM0jwv3Yu6boJ0KFztcHIkCR01l6lEbx0APmC8oub/QoazJL7CIcgSBQNo5GxiH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1pkHtD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyuS+ItU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1pkHtD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyuS+ItU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2R6s82884339
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 04:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V8gw5TeS7xi
	QV0LtLxJkCa0MBg5aJLxhqsITxqygnxA=; b=a1pkHtD/9FcWf1qKoI7Fwcgjx7p
	hqV4VosBeZ7XHhmdi5oguVdulBA75fW+cuO5p8nwR6rJpKEOJ54YpJTEfZtNQRAX
	G0XURRHgiuqbH7kByowdBgVXww/+0adu+PlZ9Vy/vdi1wXTKy5PSypGEIceUcamS
	r5RT3zPglW7/mVgIGo1RqDl7LkojlVl8y5UdG7P2jDbQGaySYcnoEtpVX3VMqQ09
	uD/4mxam+ueZ8TM8lWPFVcnFPyMJp+Wsg2WOfZmCa1G0+2oO22uD9AITOzIS2kya
	uCAnMF8MH1BUiKX3uLOBA7JKkpCbbf7RRFAxvJdEcrxvQWNEogqiomxYHeQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq825qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 04:30:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so3249008a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 21:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788064202; x=1788669002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8gw5TeS7xiQV0LtLxJkCa0MBg5aJLxhqsITxqygnxA=;
        b=OyuS+ItUQme2jSFkLIcK6KFl7DulqMQdOuNL+4o8j7pfqhS/o/E3nRXWAo5ALbJ7NE
         A1oT5/dPfZXa7CvZ31H+JNqBla7K8ThEiXUoNGisl6zUnXe6DUMaIRboCfu5tGYlUz9F
         9AwIBNev0NyosP22nkdCfqDlKooD3uEj6wSylbQgspjR5lGxJaLeXXKzAE7MXaLUSjjz
         9xo4WB4OnTaY7KMoQqZt/emQ9FoAl/wlPmPF6bmujQvYaWTaOqBVI4H3kcJExrNGMNc+
         +ycW7W+BWCDYz3XazUy7H7s5DY06c87qujV4Hl/NXvToWij8H7hx4F/qpuiJ1+ikKJY/
         wnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064202; x=1788669002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V8gw5TeS7xiQV0LtLxJkCa0MBg5aJLxhqsITxqygnxA=;
        b=ku7lk7WiGJAEhc+5bI9rvn/6V7iSAhtTXrxHUHulK/64ChdQUGRmgzsoHzo9qbHq3/
         H72j6FOTS20sjGVlf0Lojf9O5K9MlbkJRhbMZ+15xzws4dGYwp5Aet0zpEr2AOiR3Z2I
         8Ib2BVimDxBB/44unhMlI8933Hzj/B39PD+fZ3/jmIGy7dWvmaf0w8StP8Vm9O33bhLZ
         ljBAIj12vmvD0lNJy1V467tVpEBV8fY2OEhtRrwLu4WvhOHlDPSH/6iXFwDRiMlp3igw
         7zc+ofOYHM5QF+vqVVxMtoq2XEz8WVbWSCQcnJJqNxGJr6u0hbRDFgNrN9Q6Q9/4dQQZ
         Y3ow==
X-Forwarded-Encrypted: i=1; AHgh+RphGRuWl2Prz4sjBgi7hM+DPJfcB6OaekYLXUgFnYQgnV40oc+SY7x7lt9tr1joZoz9eV+zpTUmSByBiGyq@vger.kernel.org
X-Gm-Message-State: AFuF++lRBlpg100QX9kRk7xbsuEph0UR/I0NQcYkcy57oA5Iop3XgKFZ
	lSo/9if5bWLhFgndEQLkonb+10F/5bh8jU9ZyZqH5Wezal8ueEN0DF/qzyssmpRa5xfWd76LShP
	xRb/+K4DM3+dNDHmkzujB1rbRynQPGH450ruPNYYUpSruwcuiVMt8GyaIQyX0x6zipmCD
X-Gm-Gg: AR+sD12OwBP4lgiZUJMOGOpmKPmA5e8HLy4PZos3ylQUHHn9uFqvMOMM03KIblGmAr7
	IVy9rzEhX6xlmA/qT/ZHarTmMyBiQAcJv5TLiY0f4vB1Es0HO7Jhjp1cApL9vuoSNYM5mTM/56S
	UQZrHBsFoUZhFkSf5S11CB+vo6rXKa6BOtbZ4HUlD3f9WOSpWKw/DguA1T2mo76GN0hFsa4XmQX
	t8JRKeWXF3wfxzsNmbiHPngtdu2WDLWhSsmKwY+ncsNiKJEeAKLM9sJRsCe890iod5f0HusJxPg
	oXFMgy0zS45eFy0cWU59Qz4MQ4GpbB3LMi2HG9FaX7tylHBSTbmrsXPrHp1JENieD5Biu3opOzH
	x2gfdgKEikKCQIvWI3ky3PbLmo2FW2hGBjNz/cJQKhAqJnq11lD7mHPHRTuEM
X-Received: by 2002:a05:6a20:6a29:b0:3d1:be60:281b with SMTP id adf61e73a8af0-3d268ef9eb5mr28341066637.15.1788064202077;
        Sat, 29 Aug 2026 21:30:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a29:b0:3d1:be60:281b with SMTP id adf61e73a8af0-3d268ef9eb5mr28341043637.15.1788064201663;
        Sat, 29 Aug 2026 21:30:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b4bc05416sm6078941eec.6.2026.08.29.21.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:30:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support
Date: Sun, 30 Aug 2026 12:29:39 +0800
Message-ID: <20260830042939.144376-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZXOlXjgRSFUZg_mZrerFfEG9i1TNKskZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX3r5laZBvCbfp
 XNNXTCvlWea2OaNUAODKkbxMjy5ENqVAAmFVst969vgzDdGUoUD1lTs114KZksvubjXLlzu2jtQ
 5mAED9oC0FpTxKHCWyRJaXwDg4tVcaA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX28QE4T0/m+jp
 kW+Q5Z/5wXMGKlSN6O5w9yUi/8oH3+ZMY5OWQIuALqiAsHNZqdYff7lld24n2zRo0Y/zQ/AOPHw
 mSHD1oYuSptHIe3p+TJXtOiCqmOdIIwl7XPRjTgtgTuxgn6H0N6f95rhn04Ufl1C7nhrNKZ0Rmk
 lsUOEgL7ue0hDVNr8W7baj7SfI6w+V7v0o92v/4VbuEofhTurlCaOOq2x6B1EAgFx4fl2RLI7Pm
 ZE5pDmo4BqqbtPxvSYfzkMFF5F9Z2GAChn4PmlJxYxzrJz64+VlwrnAvSXr1gne0lKuCqw2s2rT
 wr0qQfNUxVjJdgVPsUxHVmgRx+tY3j7u5mCI4MnIT2izQ4Sk5DdDAg74auda+Jj/Ol/wzG8UkjM
 tRRpbX/expA71sMxBkAX8cLzhwEgEvYpRyCLoFkeCwK3ln5HJq4rTfv3l0QYuUffP4Go4GVJL5b
 UM360gDUrhovB8E0iig==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a93b1ca cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=a0wLEVJ3kHAuhMsajo4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ZXOlXjgRSFUZg_mZrerFfEG9i1TNKskZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300035

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Add support for the PMAU0102 PMIC GPIO block, which has 12 GPIOs,
used on Nord platform.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 922c27177b5a..f6dc43e27b38 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1259,6 +1259,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
 	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
 	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
+	{ .compatible = "qcom,pmau0102-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pmc8380-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmcx0102-gpio", .data = (void *)14 },
 	{ .compatible = "qcom,pmd8028-gpio", .data = (void *) 4 },
-- 
2.43.0


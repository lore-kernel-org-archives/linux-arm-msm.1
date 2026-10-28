Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200874;
	b=IXZXGDlFUmZexfGs3iHwCdrQM1iNZDAFEDOrSzQObVAn+/LGji+i1FfxLzf5d9br28Tv
	 RcRu88aZYIL1Z6Cv9yWIinu9/iF9PNn56O4OweXTDQvwFx20wk1VBsThRTevj11OxFwUu
	 iNWs+HC0VdBI3FnXf96e7EJSx4de/uWdayW4GS1w0ryj1lPJNDfvMKGWpVCvAR5SYQ2D4
	 5xaMrjIgMFYluP4OEr63GFZe7n3+WsvfGD8cB1K8RKZChCHgaA3HY/x3/SUcdDIvLg6BJ
	 gtFmEJNOvKDT5pw1Ootdvce3vqh/gpWWlipPmgv3h8gWDZU93OJsa2ktmQYWunJw87Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
	b=SJftPgVv7LgKPFYrY7iMRS6cY7afUi6NsAZkHLZ8rxJ5Hg4XPCyJIIYAVsOZfiw35wdY
	 gJu+njNn7IVXVFKlkBql3AXwZjqiFpBdBHea8pS8S0mykzNYXiYK7FKmzt07sgn8dvrw6
	 2i66BKGTQ+LbdGbldBxDtBxWTGDXeurkuoUL4jJX0tmYm+/86M72bzXkXBLsGKOeLmqQa
	 F/X5/7jBhLZM52/a3m9wtaoAE6+XoNBgTzzy7BjjqCbKgnJi8vhYmOyUB4d/TA6jmZ7mw
	 QNX9/Gv6mFg1hjsU6cuimETPRCxE+mDnEV013jJn+g1iBO7hOAoTsG9hr1XRPkbsj0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LoDc/5XT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EbdXhZkz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F292860A2616
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F292860A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LoDc/5XT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EbdXhZkz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAX4r1153188
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=; b=LoDc/5XTmMBooxcy
	IfTPwVAISSl8X+sMQCuLqyCw1eBNgxRbZMIEMdCtT0aL3lGJ7T+v4GJ0gRUNfHXE
	2Lm6sxG1cr6I7oIJVWoM9AtRe2X8qWExgfPAGfUKVrVC5j19upkd2qGgct+8Uz54
	tpdjwd2iFkQzUeSREFrQM8dmbiTJfp5EbZvkd2pRQS6rVWwFeJ5nWuGgfhstkHkN
	RIA7Yz31fwRanknfdJZKPUrO2tUt7JyE709L0vuQqCBaI0QjDFslzruXhuO6gQOf
	H9prJ/sg9N4kHm+lnmWZzuenAiOI4rLs5w8Gc51dsjMmz1ht2tys5GRdN5wniOvv
	0091xg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be34pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:12 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-677c4ca2265so1845941d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200872; x=1793805672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=EbdXhZkz17UjAsEzSbwZjXnuaYzpBSGpi3OSAvmJymq4xypEC+8P/LvUnBA3/Q0ZuQ
         ph+tT6wPdkt/65AbgvBj/IQc8bApJr9GMNUqux2MCzh1DbYXuZ2Om0R8pT3jkOibQbTV
         mWGjjAIRQ6VVbhza96LMJjgJM+FoECxk/avcbDMXiZAnFSawjrRyTt53HDkO9ORUKAcb
         68rUL4wm8n+lpmGIIzNIB5/CeYtYh9/IfQ1KgR0ATf1Uzm+8DJuQgVWuAy7U1g1jBQ84
         Nxe2XXk6kgfZmBu9ktllMpet3SFAsN4fCBk6VZ4x7mEmKuPpS1ZvkAo4q3LJlcxU5sZG
         WSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200872; x=1793805672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=2xoL/wUmBvg1OoRnQnYrtkhGvb1/6PRAau6/7gps5/wAJleZUBCFdBkCj7UzPnhfuy
         Ue5V0IN4luTstUvND5IZEHDwzGFfjAeeJUxsdWACbHDLOZGH4ryb+StLSQonnnsrRZkG
         H0sZnTJ1gbzO2Tji/phsovyZ97+77rFgn/UkQV/v4HfwsWY8fLugMd9yd/90VYyRjKsd
         pdZbI2PUdbHrNmIkrapw3S98upcDYUyVe+LVF7AAN7+hyxfjwjwhgZg7sEqjZiCuR+w+
         T65u18OWxNdPt1wBrME22xk+LaSjCoVpHIzHGYDy4njAEt7OdKUmEZk2vBRXS+wmHXHs
         RC2w==
X-Forwarded-Encrypted: i=1; AKwUvByQTNIUmg9SCgJ6ZkwMaebPy5U0kBONhOiTaXAdSzZJ4WQcHwrFcAmHxq6etsRYVliD3usKdDbIZDdmM8tA@vger.kernel.org
X-Gm-Message-State: AFq9FYIStkuUC30FDOHAZ2K+Wf3TpN7ihVEsomqJdsL/gaatq4bvzyyD
	43vBA2fas2jp01V+C2zxJeG3OvZiUMaLz0ghCcbBtJc1sZugxxtYfR9BJhhhcPckUVubXeommH6
	0LFooDZZWiaTXE5W/fCsNRtJ+Ko0o6EdNSahrqA3t7KVz0yYXFHCInxCyXYrBqz6gyWuW
X-Gm-Gg: AYBFou2W9idm4YANpfh4cfwHtoKqUBMlJ+LMmPtxPmsJTfx/Uj5lDloXMhhRiV5nbba
	0ed/bLeFAKP9D70hr1Laif4heVZETXV/NOAStowABk18NT0f5kyHatolJlspWH04vbI7TkEcvcR
	1fSyjx6KgIYcQZ/6Y4vCJaltJe1eMZ0T9IZcmeiqcDkF/cDh1CLSabzlRzXHjXLCgvNUzup5L7Z
	7lEkvP9xbboZNS8c4to3sM6WH5DXjXRStDZ/hv6DafpEhsgWar9t83SkPxgOz8O3lt1zMG/tMs5
	AJWXiwvNh3GT0GX18B35/nXRsr+Zx2RT3Gs8FCKp3hiR3qoSGNmyd6IhB4Nd08hxcAi8A4G+VZ3
	iANhpnyBXGdP0xXRmyQ35YbXEXE3M3F80DlJpKc4RrzIHTXDodOFDnIaqKtSHTLg04+U86kvCtr
	NpImJN3OAzuL/kQDhhv0WBRYnyaGpZ+mHxo6dtKtLqOqEhpDqRLYEb8a86uKab
X-Received: by 2002:a05:690e:1248:b0:676:9262:e743 with SMTP id 956f58d0204a3-67a7bd7dfd0mr1878880d50.107.1793200872165;
        Wed, 28 Oct 2026 08:21:12 -0700 (PDT)
X-Received: by 2002:a05:690e:1248:b0:676:9262:e743 with SMTP id 956f58d0204a3-67a7bd7dfd0mr1878836d50.107.1793200871586;
        Wed, 28 Oct 2026 08:21:11 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:10 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:38 -0700
Subject: [PATCH v23 04/15] media: qcom: camss: Add addr_update hooks and
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
Message-Id: <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: HBrUJ3vrViAa1qKm9yw4FZ4SIF55tdR3
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae212e8 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/RHHAfIHeYgn
 t26XGbUgY3YN1qTF+WlGzSBa8KCJxiLrAaIs/rEo8aHgMiY+NFm23AW+szVITKs/p/dNmUXX+DL
 E3mXCILxZbzZcDy7I0O/sk85/jyE+Kw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7y/rIAZj/RII
 xPtOQD4MKpBe86iGgj1CfIFrUhXYzzgr3jbBi05SKCoqr4qAaa3oKpdrZfNWNJhYha3tkzxtVYz
 NONdaRdd0mrwNr0oBCab8E0oTcUoepLf9n2n0uOMUxYyBjok4tinqhcvio5CFTtvoIoUrdn5Zbx
 UD4WpKVKgyYygft4KUUr+GCIWfNQZpgjK5c3djF8OXm1fffs7RBei3h8RfwAG5Ky/5rwVIBO3s6
 nHzLUfWF5nPu6T4v0rtyf3MFUbFgXraYBwDlQCmyuy8hFIEh4lYjNlEpHkhu126Q5PPaFeh5QgV
 NreaSLzTV0XXheNMcSt0gvUBtRfvggsdZd16iWa4xhoiP3cQsWixMMnyd8rjN3GzqEoIcmcZwr9
 CvnxJEdDnIxtFWgX8SvFNj+XXjTq5Fj3aRAsFLRlYZf9zVf1/1hxmAUh5H0+QzcJJQdMfX/ocxG
 PfhSnTmnwNeEZVOxRWA==
X-Proofpoint-GUID: HBrUJ3vrViAa1qKm9yw4FZ4SIF55tdR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

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


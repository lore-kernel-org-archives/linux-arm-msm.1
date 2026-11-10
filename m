Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302526;
	b=MtukTx68lTd8Qbzlp4YSYnrwhEGruFFvk3qhFxysODX90rE+xZBqtdJZ9uMgwgrsW3Ci
	 Si/VynTbYQlgtRospnYwGbFcAD6l9yUQAZ/tb9ylXkil9CbPs90Uxdmen9qqPMSix92kG
	 mZdPXQerhl5WDpq3ydEOldPujX4HbJvEHY87UjPm4B5EJ/Txle4gZlB99F7tXo3xBRdvm
	 SzblLbX3uY4o1jQ3UdfcbTWzXItzKl0SQwiM0U6a9Cv/1uGeaN7JfgTcXS4EwU5qWMN6r
	 fh07cV99/ZgdDZ032rRlmFdJkaD3VRt2u4iiLa9zltA/GYMludfSesk3VIhLPaA79OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7luiHaRw2yBauh0ow9oHCU32cPRl15BDQ5bNisD4nT8=;
	b=Y+tSSERl0b3UZLpIz5/ACwGGctgZet63DheFGheY3wNcxDbpp1eqlv/2ErcAS7tDoI8c
	 OqblXj7T7mSJraLNdR7s49Z31ITVSGYv1pceFI9974UG3iYNG4jy5J8JsbTl/Kv5K7wOT
	 9SE6fBsq8yBgTAzjIQzwZE8J+OFMUTn6/MpN3XKRUHjw4HDCcfgB7Q6zb8HbLxGBMwQ6T
	 iV/U/+g7e1gzgfXL2kzEh/gJC7ACOedu2R9XiOBqY8J4fDe3EFLyPnn4wK159SLd4nfX+
	 Uv+RQz58v/1ODuFA/Dy9XSGNd4AidoN8+dhcsIoxGuzxwWTQvxCfPake1rgc+emOYPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z/bh1dJz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AkOBSyQ8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D9606E59C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03D9606E59C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z/bh1dJz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AkOBSyQ8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8W4fa2833660
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7luiHaRw2yB
	auh0ow9oHCU32cPRl15BDQ5bNisD4nT8=; b=Z/bh1dJzEu1VV8lS/IL+vUcPQa+
	M2kgYdLPkohSbQU3wwLfLE7M8HyE8V2FXRBPVOZ8tkYUg7LgEAN53HnxqAsPIj+a
	qR+JJSZuAaej7b8guzkr752Q9WMWgBM4hSuB79S02BQbEsVwQk3LfRsCmalPSpi0
	pbAf1pMRPcf4S1LTPLyBHPTXLRTBEMnrA5e2et35UT3SzNWpIAurvsSIkNkn5AFI
	qj+5PonWloAXvA0iBgggigRVeSYbXD7gZmHyJmirIdx6qxkNlcCW4V7ii6G7UdAZ
	vS272+0SQI1eVCSpQPZMFnwjEjAcKQrl1ccsQM+cDIHuLrFiZNtdDmJs+Vw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufr6qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:22:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375f0fd31f4so105753eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302524; x=1794907324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7luiHaRw2yBauh0ow9oHCU32cPRl15BDQ5bNisD4nT8=;
        b=AkOBSyQ89ZS9jjeiPI4Soyj6qeExiNO2QuoLoTTi+aD+3b82hQzzjICMX7F9cpRSfh
         0uub0Zu9n/Vl+LZom34gvOOkObuGqZ6y2agbXNi+3rTjDKVrtdY8zHp9EiRT/3Uu2H/A
         iQeh660XSC+LT+FYCQvpC3bOfIouDjpwn10eQoFdCHU28ai5lKzBW1a+e/5fEQX3c4LX
         XIfm4XESK9QNmi9ky9dYg1scTdPq8b5EKk0tj/RNxuIo6qlDnMHtVbcYqzXye0wD7Iat
         GeesNGcixeZwnkXvPyPII/QM6nDAlPix2wi2iPmqxuUzCVY0x2Tks3VLWgHFhB07sou+
         BHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302524; x=1794907324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7luiHaRw2yBauh0ow9oHCU32cPRl15BDQ5bNisD4nT8=;
        b=oOLetnKVs5k7i1UpdrQsCWIV5CbNF+2JLqk5JbWdH2DKer31uZCNPJmOc2CGLKdy7n
         aGEjtAThqoxD/mQTFmrmXxiDFl7WKDlCIZ/+kAj2+gwrYx8PiYD6seEb5+wQ+jEPvfK5
         +ERmZZnnuFxlzuapGJ5OIgy5F45kaptTCgA69haLjWSGXhee0X/GF6SfjSFGuG+m7iTL
         Fm88ul84YKHaWF5IsYM8LaZbyNNe0zNhLIvF5Cs+bB1AJnX+ReFYVaE2mBhfy6Dcr+gA
         YWhYh/fzDezf5vwdI58JGp2V/QlWvzOiHqB1NZ6xitIkmmLfhJCmdTnkJTtKb1o3Qdzn
         Pcew==
X-Forwarded-Encrypted: i=1; AL+hErE6rgvKHJQsSxKYTu3Q3TyNAeilPUdr09doLsUSDhW0505uyccmqjcsnF3bTJcnKyAwZfnVyamz/vVbyrWJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/8QDo6v7dhc8ijh0XNkNrPL++lZ9h08JlXtfEju48X188RuI1p
	6FYhRb9McqN6wdnePR+B3V/j3TIRTqUXifsXuTbw86FvnwtcXWoOB6Cale5IHceC/bOC1MzODmx
	qQMZT2jDzR69n/lTUaW9SiYItxxXqTDAB92AlwIml58Ch3inP6BwfkoGs8BgR+9XReXOk
X-Gm-Gg: AYBFou1Lmv0n+s8eGRblsuSZulEBMFfhjo+K9cHhLI4T5Ca4MkuEj+ao1qXl3i47QIg
	lWAVEiXfXx7hWMKqFn06wnX4PjgUAAJoJEKNSmhNe2BmNnoXOeMeboRsmp1MxzWjmp3cmFzRHxB
	6BKfvLuTZPI4tcGW1o0Gu2VFOQGlIDbwzkpwGZdR9mfL0dX/lqJ2NGOcbnb7wW3ohIzCY6kvoYF
	F8aiBDdDorSWpqXSE1/Lq4CRfz96s9a51JfstxJrpz2qo6pVJK5HQSz2fr05+0sdqvTUwaKZyed
	AsYZTAMag7RQAPaI5yswJWjeGZucqSAZPzDF77HyoIF4ldEvC1T3Liz8dtypLRJFZ6n1X5Gi6Kj
	G84XvSG7iIa81hwjRahPKYlaJ0cMjRf+0WjRWj5uJdJjonELFAPz0VKCOukwmyZzzHyMGYfsZzi
	TRHYelui9142x7IZgvJNDhHQ==
X-Received: by 2002:a05:7301:4d05:b0:369:535f:4d12 with SMTP id 5a478bee46e88-3751c53edf2mr2529619eec.3.1794302524236;
        Tue, 10 Nov 2026 01:22:04 -0800 (PST)
X-Received: by 2002:a05:7301:4d05:b0:369:535f:4d12 with SMTP id 5a478bee46e88-3751c53edf2mr2529575eec.3.1794302523674;
        Tue, 10 Nov 2026 01:22:03 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm5257153eec.28.2026.11.10.01.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:22:03 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH 1/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Tue, 10 Nov 2026 01:21:57 -0800
Message-ID: <20261110092157.2989350-2-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
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
X-Proofpoint-GUID: RLd6eouPq75XYXTpCCO_SfkR2pPErOab
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2e23d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UBq5q3rzQQf4y2_YTtcA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: RLd6eouPq75XYXTpCCO_SfkR2pPErOab
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX6gCUUEVb0a6l
 vSjkTkqbGehKW4KmTxaVOzbM3plJJ8yLncJwNCDggFj5uWmXQ3R0I4Bp4YHOiwMibFDlmRP6yoa
 tOGfsBCPiEfLPybEVPqPSXxeJd0RGPE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX/rmQEm9gK3YE
 iwOt+Qrcxfc2AqEONxLwGT40QleZQ97YZxEj24C1o9OwymO3dIlzUuTSYjgldZHSd3rxZREPv/X
 yugs5XJb163pYheObr3sz0x6RXQJ6/+WPAIVW2kK0MYpHdW5o+eMB/FMVbddJgEfh6ny5lhm95t
 XtK1YqHyE6QA1rPCbxiUEsxkj9KeAy5PSk/iaWgXJxW5Vgts2JNpXcLMyrz/Svbaib8vo3vzn60
 2+HlG4iyFNSa+Zoxg1MpZgDppCZwHAOziGdBz7M0omPoYKnIzW8MLANY7Nmhl5aQuS0RVA95NXa
 JMZh+t3AlohLKBnX7E88EkXEEZ6XdpARfOT3Zoz+PUNTFRGvpkdbAU3Zmip6AgD8E9/5m8iLSQ7
 7wsIS2BcZ/0UHHGu/mQfjelLVbbg4WBa20pJ/wzTvIbl9nZbRS5JMnSjYqccpmI5vyPqLBTkOal
 Q2Gw7J92qvdc1dp3itA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100037

The "wakeup-source" property, as described in
Documentation/devicetree/bindings/power/wakeup-source.txt, only says
that a device is capable of waking up the system. Whether wakeup is
actually enabled is a policy decision, and drivers use
device_may_wakeup() to decide whether to arm the hardware wakeup logic.

Currently dwc3-qcom calls device_init_wakeup(dev, true) when the
property is present, so USB wakeup is enabled by default. Users who do
not want USB activity (e.g. connect/disconnect) to wake up the system
have to disable it through power/wakeup, otherwise unexpected wakeups
may happen.

Having wakeup enabled by default also costs power. In host mode, system
suspend skips dwc3_core_exit() and keeps the PHYs and the wakeup
detection logic powered so that the wakeup interrupts can fire, even on
systems where USB is never used as a wakeup source and the controller
could be fully powered off.

Keep the wakeup option default off and only mark the device as wakeup
capable, so that the user decides which USB controller is used as a
system wakeup source. Users who need it can enable it with:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

While at it, drop the local wakeup_source variable and use
device_property_read_bool() like the other property reads in probe.

Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..fb535e9a4a64 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -616,7 +616,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct resource		*r;
 	int			ret;
 	bool			ignore_pipe_clk;
-	bool			wakeup_source;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -715,8 +714,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
-	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
-	device_init_wakeup(&pdev->dev, wakeup_source);
+	if (device_property_read_bool(dev, "wakeup-source"))
+		device_set_wakeup_capable(dev, true);
 
 	qcom->is_suspended = false;
 
-- 
2.43.0


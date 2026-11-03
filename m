Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686448;
	b=qFBKGAfguxsTi20Ll+J/utj3hSNe4iVclHkViXH+SbgN8RJRXmiQTQ7BebyvIK3UiXqg
	 0R7C9zo+4omyE1hy41kvuDGGWuwlVWFjqsA77hJgEteAL9/9cdrjEMpqIUMSZHz4Lp/s0
	 bNo5zWVI9XfuhWv/3/7aoHHDyKuzjh0tFHDM4QK08rPpxmP2tKAdsAwy2KBBas3NhT3BH
	 33LiNwQKazGNSLTX/pRB/F4wT/U/+o0UPAa8ghnH4yYFR1s6D2rzOtVofmIqgV1exiI4J
	 TB16Asy7uQT5lKx/2yXi5r0pKNUOsnecD+IJq1/u8Qxiv9aEPQ1/O70L2Btnw26BhSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpojcPtnT2js=;
	b=FGEj8W6fX+9KYWK5aHbsz94r6SCMRXqeUGTiFR2TKqeEivIe4pQkRUBD87bvjrCxDOdP
	 +SZmiyAaVHbiuCFu/qxajhoWJHR6HdqJHgoqz3ILZwA6HXDz/8smsdz6ElpUuVVe3xlEj
	 Uu0K8nFWX+n1iBBckOksT8yBywnJiF3L3bPD/i5erV4iO74063lUPJTS7NfuC8kAn0jyv
	 iM3zXBIctMmIAF2cNWGHlZmizMwlKd8A22/BBpDpOBWOZziFZj30ZvvBDtFkKvyvsfQIZ
	 VwaBRenHnsBiaU+ejcjRy5J4omwfO+zndevS9GRBEW5eqigJLFP95AaEDqiNSFrnXEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZRF8ht2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCNNnsIS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D5A606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 06:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D5A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZRF8ht2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCNNnsIS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eL601397349
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 06:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpoj
	cPtnT2js=; b=pZRF8ht2hgSHW291i5O3z73nRN7NmpXzRFglnWgQwJA0xOuUvDB
	wE+/qKLEqk2qHTu8eyuQ1faSo7WmzJF1kuxAJtOG7IOKh32vjoZNAiy9XTVuTR2a
	+ReHxL28FPjgy/IRmtwfNFCjGstOGIlYrVP6CGGKDeNX69ag31Hx41lT/bepbEO1
	mdIPWzjL/r+OLmIsk2ImOaeMsnWoadthnSlawO/XGTUoC5m/7BTiiS1KnGIcZMos
	iIhQE3CBJdwajev36Te05vyt7C9c+adUZ+J3f4CwdOX8VJd4tvFRxUgqeZrnKJu1
	21UynGItlPHL79qWwWmH7A5JXPIvBMRk3Aw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5h549-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:14:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so16229234eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793686446; x=1794291246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpojcPtnT2js=;
        b=UCNNnsISsBvsE5eajT9paFCqWbsyihc/WHTKSmWTl8/rk5YKP9Xb9pwNlveZplNLkI
         t47MNxbgBEPneGUbVh0W4tFWXbhmagBzFqXNtrk+qZlPeJd3IJ2UCY4XZ0Mqedbawmr6
         QJyExejJ4pLonaFn7rH1L02jTcMExw3CgsSiuCeueoViBKXvE+qkUBZvm/8AwoRywzfA
         hCSxqh9nkPs3vwcgE7Xz9ONCkrzwTxeIhMQvl5yiXt5YArdJUxCr4tTnGv79eEOGaY+6
         ztJr4RDByMLw42oLY6inaeBZqf0iZSZ75gKfivGZtt48VRZNZcs/eFztMlbQXPPeUZHy
         ofXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686446; x=1794291246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpojcPtnT2js=;
        b=R0NwqJ0F41b2kYbCtvUPfNqIXC/hgeC1MOPuBOOZrtFXhqk5XNqOC385HdG0e98DvY
         QqhdZZool8HQ2Z/+ZuueAaZyGqqTvOTDoGRUWuzdf6V0k+Px9mE65gAzxOTDNKt3Os0U
         JWGQd6yr3WVBvRoIZ4ozYm0tZGdpBVLxJrhU1vTxpXSaSKNDLmOshGgpjKB5XPEiV1M4
         lbPTjVAhc6NHfGR6DFRAcQYWCWCfciskGCANm4tyWWPZ0Y+7pBfpc5ItFjuqwPrLFZIH
         MjxOEbdNWSg9aj+WA4cZ4kbQ5gmpdPEQfenTlMHldMLDEGY7gC8LbDzxzdzfx8Dc8F66
         13ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhK4oyruHZ9V8UWhcLB0mOu1sbri1NCWd2Kd0VlrxG0nqSpqlNcbhQRU6YhxsFB/4zKC7kllKM2RiWiUOP@vger.kernel.org
X-Gm-Message-State: APuU4Z+x+miem1CyMToJUObExtRrzqiMnaksUnVem7eO3+zG6kflGLcr
	n+Cmx2Vn+UG3j/CT7xVwp0OCQkZy+XZPYrlVpY8/D3A7Ccd4F3POOi9QJ3EWeYTBo+vEKkkTJBX
	i4Em74FeFJ1SeX0P66LwxVkbY6Icp5K7QuBXYYwrkIp8meB15ci1+jAiK1yaxYCCiihnH
X-Gm-Gg: AYBFou0vNcancHeNr4U0/9/NzaxZ7uyNZ1FcAGITdK5jbRFaQX1J3737I1sMW56gTk4
	fVyvXW0ZDLjHIalh1xPYO2JdYq0HnCo+dZU+ScXBvmldny0IVvSluXrvWF8TfyMz05rt6GPRBrt
	qHS3CiABO1lNOeu248xUwn8sTmRUjwBhqIp1b17WDwdAaqmo99tO40ucsubyIxDYp44HhCpxsRs
	GB9tCq5oGj/yWzvyVkuU9+x7SBFQU6TiVmUY7qw+rjXwSSCw7NZODpJPosNXLrcNBW6zmxu4Fir
	fgUPglhSzMmHp9n/y/w3QKLMmA2+r8dopGA/7MfnnB5dK9J156YMpRUhHCSZBhQlwYU+7GhwvoL
	zMQ6Yu4LsG0S6Zt8/v1O0ZWbsqz1EIg5Bx17OCKRXCvBWQu2HKtCf1KlBVQGpJT9sAzVxXUtih9
	+bxDKH34aUHpfAExwH43ZqyA==
X-Received: by 2002:a05:7301:152f:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a42397b34mr13292157eec.20.1793686445837;
        Mon, 02 Nov 2026 22:14:05 -0800 (PST)
X-Received: by 2002:a05:7301:152f:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a42397b34mr13292118eec.20.1793686445074;
        Mon, 02 Nov 2026 22:14:05 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36c8d3277e3sm1947091eec.29.2026.11.02.22.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:14:04 -0800 (PST)
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
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [RFC PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Mon,  2 Nov 2026 22:14:00 -0800
Message-ID: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: 6nlAPACFnP1POcDM2rOUb3EsTGkeiIjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfX8t8FT0OgMqq9
 aQWRmgwmwIyPYbiS3XP51QlrCeuFWHw5Yzar0bJNt2JlEIrVbwdJ0JzFdJ9cH2Y4m8qwFWnmnAD
 JJAb1eKAJM8E9+igzPLyEyh1EUoeHpQd1jqRzDRECFnqAfibUHodMkfKrw6aAV52BpaXKYV6QAE
 fAONm3j7Nts2la45rd9iBxZVeGbK/d4oPJZsR5eG1EhXR/MD/8xHpEQ9Imm/qDSTaP6chSmhDLQ
 hL2ayXb07GBjVCxz5aOVre3vyfS24a4hLZ9X2DgQe2BJEfjjvEJTbL1CmCpTmzVB6KbwRmyThTv
 PIhiD6s5YgZ8DQ+2OQApdDTFwshjOY0WpUELRyS32Yg6e/F3szMZQniw5ckMgjdPYpc2orYVybd
 npoxHzDn77nP/TXhxw/5qnOh60jfew8uh8hIEk1571eBOI+u+JkR+K4YbdkprruARN0Z3ogr6X8
 v5NYijaldmRjFhyhPsg==
X-Proofpoint-GUID: 6nlAPACFnP1POcDM2rOUb3EsTGkeiIjC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfXwgAzVIUd9ctV
 Sueyl0p5/jxLAXtEi+dkVqYPPDjlM38/Yw2cQHvDrw/H/aTTrRqrz+cUcNkvaLLtHwlZoj4o2qX
 6FCzwn0LkXIVu2y6Txwh/j3aJMgYUYo=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae97bae cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Pt4Z8C64eHDFcQK2EPwA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030024

This RFC proposes changing the default USB system wakeup policy of the
Qualcomm DWC3 glue driver, and asks for feedback on whether the change
of default is acceptable.

Current policy
--------------
When the controller node has the "wakeup-source" property, dwc3-qcom
calls device_init_wakeup(dev, true). USB is then a system wakeup
source by default. Users who do NOT want the system woken up by USB
have to disable it:

  echo disabled > /sys/devices/.../<dwc3 device>/power/wakeup

Proposed policy
---------------
"wakeup-source" only describes that the controller is capable of
waking up the system (see
Documentation/devicetree/bindings/power/wakeup-source.txt), so with
this patch the driver only marks the device as wakeup capable, and
power/wakeup starts out "disabled". Users who NEED USB as a wakeup
source have to enable it:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

The motivation is:

- Users do not expect USB activity (connect/disconnect or USB line status
  changes) to wake up the system unless they asked for it.

- Power consumption. With wakeup enabled, host mode system suspend
  keeps the controller and PHYs powered (dwc3_core_exit() is skipped
  and the genpd is not powered off) so that the wakeup interrupts can
  fire. Today this extra power is spent by default, even on systems
  where USB is never used as a wakeup source and the controller could
  be fully powered off during suspend.

Comparison
----------
                       Current (default on)       Proposed (default off)
                       --------------------       ----------------------
Initial power/wakeup   enabled                    disabled
User action            write "disabled" if USB    write "enabled" if USB
                       wakeup is NOT wanted       wakeup IS wanted
Unexpected wakeups     possible (connect,         none unless the user
                       disconnect, noise)         opted in
Host mode suspend      controller/PHYs powered,   dwc3_core_exit() and
                       wakeup IRQs armed, genpd   genpd powered off
                       kept on
Suspend power          higher, even if USB        lower, USB fully powered
                       wakeup is never used       off
Attached devices on    stay suspended, resume     reset-resumed or
resume                 quickly                    re-enumerated

Possible regression
-------------------
This is a user-visible change for existing platforms. Many Qualcomm
arm64 DTs set "wakeup-source" on the USB controller, with this patch:

- USB wakeup stops working until userspace (or a udev
  rule) writes "enabled" to the controller's power/wakeup.

- In host mode, because device_may_wakeup() is now false by default,
  system suspend takes the full power down path in
  dwc3_suspend_common() (dwc3_core_exit()) and dwc3_qcom_suspend()
  powers off the genpd. The controller resume may fail if power down
  path has not tested.

Comments on which policy is preferred for USB controllers, and whether
the regression above is acceptable, are welcome.

Peter Chen (1):
  usb: dwc3: qcom: Keep wakeup option default off

 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.43.0


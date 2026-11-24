Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488435;
	b=HvQyStWKMGjYz1gbAbehLFM83VTeNumWqs7UxHsKKVri7DhyqxAQcf6tEG1tjAGM6M4p
	 sbL8xvy/OriWnAbKLvpalrpxKzWUexfjiNl2QpUByiKEbEhRuFDO1EttOrE6QZJ2tS9yw
	 VWMmhjRbD4zlUHRPSLcVkXzSRoCJdKRvOhkOdDQbstmDVn0NnZRYkdS6g/VSSMmdfMdKq
	 VLNKlC6zCotUtivyBsOUVrxg9y4Nuele1XNwqZuoW6sk+CJYLyEej6WzOzHD+oNNKaDD8
	 t7RLiK+Pvk/MlKOsfn+X9wM/VWF1PgL8qlJLbfitvvCuFq1QBy0aa/RU0q8eFX5D2GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9H02wQlFdIPXluo4QYcyx4DfthKEsjHhuAsKhNR0hjA=;
	b=h+mKTIF1dC9Qfk/5gCso/XHMmJNw8JFYdRlHE8fxEp5hs7KBue/966vVd0zZcKd+8G3L
	 IGSq8ksErjADNQNQrG0uwMuUxbSBJjFB3YaQCb0tpgdGPYh8T45OmplYh0Z5cirSYIXKD
	 txn2AaOkVvo9svtyP2Mub5jv+3hQtFzP7xjx3ngh0pUbDlgpq0sR/j+mUJEpcnGd9GQrI
	 GmmhvxjxAINLeEWxTpwiKITcEplryyPUHjLuecLVselsfHCYNT2xTYzvDP7Zru2PYV66W
	 s4ovVNjVrY8X/gfLe9Ow4Nhz8a0fnJprbhx0kfXMiJbXO09ljex7bQmVRCChDGjCuWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bQZe0YDz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6RMTDn6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA8606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4EA8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bQZe0YDz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6RMTDn6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kPbY3851153
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9H02wQlFdIPXluo4QYcyx4Df
	thKEsjHhuAsKhNR0hjA=; b=bQZe0YDzTkdonnXeELT7B9bA5TvvL92s3bCTVn7M
	INPDPoc5ractfCsOpm42KbDBPg8nxqVwYIumL6eKqSXXHa5PwMGJCR41TZsM3qH/
	qKqevsUVrqeLA0+3gV+eDwI+1pCN4FtCzJowkA6aBZ0d3D0zr7n7ZKPJD2r2LgCG
	Zr2COTTb67s8McvamY+innqVWzw1pE4dQZZkRO88ekqQG9XA8dmy48vGmXpIyWmF
	ogU1BNiY8ORaoDhWOb5OJ3BNCQr0tDGsQqKwgcmE+4m702gTlYEsUTHEbcEA7R4w
	+Wfd4mfk0g3fjGkPbxaMBdvQCwdSYPQEoI7DCwqRNW+9Rg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb0edq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:47:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1717218c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795488431; x=1796093231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9H02wQlFdIPXluo4QYcyx4DfthKEsjHhuAsKhNR0hjA=;
        b=f6RMTDn6Tmfd0ZSrSOSC3+JbNh2ZP17Tlt61KAVN/R+IbW2mN80hX2n9bDG1N5AFol
         Jj0lzZwNe3ekT2u1ne1UBYbb7BkDGV1P7RoO/S3qbCeIoKiq+gN1HLpN9MONJVNYOPiu
         ryi96NEtui9m43xlKG9SlG5y5lZdwLcmRZ9101bqcEkdug1hA/LPJgaNQGR3hhZOnXXE
         Vh2jHw726jA/nOVEYbcAOW3qfeLwAwxBKInGf2XvHm9YYXjkNnx4wH7EUmDJ2chM92ml
         ROPomxEHU+a9GJMIIM+gk6B5XIM//oDBtf/gXQdu3hw7GPtdUscBIaV3eO4bDwBNzAOg
         S1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795488431; x=1796093231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H02wQlFdIPXluo4QYcyx4DfthKEsjHhuAsKhNR0hjA=;
        b=aBx54nc150f9MfLKLIZx//DeKChLPFZU3S/7lmjJXrajKMiSd39zf+tfEtLEohmNw9
         HwTeHLVIRcRVN/GVzBEA9q1K31mZCQPTbYr83ZthTNzVKMeY47bYCi+w++0jhEGMvLkV
         6GJxKolAnw3RkIAz0miu854hvmY52+BfCRqhYYdA5wfXQqZAI7lA8DABP5z7A8eQJLTD
         RZKWVR9MoHaoljlW6wCmcmJm1AnV9YSp3qlq3SD8upj+PduUzdL/O9WiYKAfWb6SYwD9
         IPQc1JB5hgdI0yqKBAltNylwOBHp8tfMjOHqJtQ8Te8zJ8E5yrBRO0xW4J1i5fm9Pz7N
         jIhA==
X-Forwarded-Encrypted: i=1; AL+hErHHNYal2kbigufHr18/N/iQOAg3Agq+HcZRK7XCLkhCW/SMI3mDC9VV+ZSYa6NRirb+YpsMt0s7iIH+9jRY@vger.kernel.org
X-Gm-Message-State: APuU4Z/symj647wo7XVCTBhHVgQbe8FQf6awwCI0GTNDF+XqKU86vb9Z
	ccNVJLYfSVv2X3fbFpj11Zu2wZRuGBr38iuJDz+aEdsyld0iviyYdwy+D1ljQAakrN7sdfUey0B
	PTwvgtFcupLlbZMik0hVatWn2tlvNFPxE20gzKFLVWJUGZI7mqzKpJqCRyK0K3OcgeprB
X-Gm-Gg: AZFdTZd/KNR2c6qXAbPIIN7uZJvgQx26I3qw5J2PkVW2cT/26LpDBi6lTJwwgdHk7lG
	gg66vESHqdFqa+gAZtDrQgzTvl5nLZ+71c5PPsX+CoRqJKiH9KFZZp17TcaWLHLOzjxk2Ci5BEo
	lPzQuCmz0sA79B466uYqFOhfQvbJKtFp4F4gYwLC6HxN8IM3fbgk5MWYFg9db9L4leDLVEL4nXJ
	3ZoJgNUXd4vWz5Pemak8QMzmm4ICxg4lHYqpVkraRJWfZmNBiyc2LPqgC8D2MN0Z03EbLOU8vgr
	1dpX+2lmMdfXg4hQp/PRN7GT8gdDWrnufGdbTJEAOGgnKOhwV5zNhvwktaaSgb6k/DrJWRW+3OS
	rXhhbgCcAkyEw5e5+oJiXZj+4mPwn/Cx8crzWbvR1Pz9Cbmbb5ktoli8xblVO+5Mi48W+RWcWWe
	DFAeCBooZVxBuQV8ndzb9ifyI=
X-Received: by 2002:a05:7022:2608:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b5568b678fmr18621064c88.6.1795488431309;
        Mon, 23 Nov 2026 18:47:11 -0800 (PST)
X-Received: by 2002:a05:7022:2608:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b5568b678fmr18621015c88.6.1795488430785;
        Mon, 23 Nov 2026 18:47:10 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm35685565c88.13.2026.11.23.18.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:47:10 -0800 (PST)
Date: Mon, 23 Nov 2026 18:47:07 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, heikki.krogerus@linux.intel.com,
        abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        effeffe99@gmail.com, prashanth.k@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tapas.rana@oss.qualcomm.com,
        vkoul@kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jack.pham@oss.qualcomm.com
Subject: Re: [PATCH v4 0/2] usb: dwc3: qcom: Keep USB 2.0 working in
 DisplayPort-only modes
Message-ID: <awT6qwRVeAuPRBth@hu-petche-lv.qualcomm.com>
References: <20261119124558.1548-1-26rote@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119124558.1548-1-26rote@gmail.com>
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b04fab0 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dLxMsxsk7CsyiYUDLEoA:9
 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: tATkNqc6jNqa7h3ky6r2SjTckbYzGizw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMCBTYWx0ZWRfXwNxuJTkb/8f+
 xCyntb/HZ/hJqDQ2rWVZUN8oytu2CfX+fDW71JgPWkZnGq2srg2evLdgKOe7Jeh+wIhH7x1HDFI
 KxpzbZv4rn6w45IX64tXGnJtBTn0VXY=
X-Proofpoint-GUID: tATkNqc6jNqa7h3ky6r2SjTckbYzGizw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMCBTYWx0ZWRfX79yyz951eTIt
 NdF92+TJQ1UCBnA1ymW9Y51W9VyKk8x2UIcopskSiD2NS3AaE5thDCaDbKFWtf0kugbv0XrpQP1
 Z6tFrKgZkGOXINsRS8KbyiQE6FMhkrngVZub8caWL+2lKiPzVEypvvUBczFZIvtUkmBD728bNYj
 wzp8Mwv8bt9/Xh7STCBPEt7ud4R+1YR3ZZT+8WK2CB53lR5mfxZSScgVmPVGh8eiNoZc7P7BRVr
 /th1qcVc4RGrCPr3RgBYetMgJ8MoDGoyQhDlanbVDP4vcv4YrFod01zNdBFLv21NeAdnM0iaXO5
 UyH1U9NWd6Zn+ShWPnp8AFIsXpLZctx2f/uL2wNL7eDoO1al/iCdXngGWsIXNpHFlBPn6DelfRi
 S3KYlUk/Sq63yJeVYopEMxkHOKnJuArEuRdMr8svmLdQyuhfB64RsVgoNCJ7Me8Eo3RxeJkbAlk
 sCStg1G2/uEczd19Mnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240010

On 26-11-19 21:45:56, Joonhoe Kim wrote:
> With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
> USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
> PCS powered down. The USB 2.0 pair still works, and such monitors often
> have a USB 2.0 hub, but the dwc3 controller still runs from the USB3
> PIPE clock. On Kaanapali the next xHCI reset in this state times out
> ("Host halt failed, -110"). USB stays lost until the cable is replugged.
> Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
> common") keeps the pipe clock branch enabled. That is not enough here.
> 
> This series registers the dwc3 glue as a Type-C mode switch next to the
> PHY, so that it gets the mode (it does not route any signals). In
> DP-only modes it moves the controller to the UTMI clock, as
> "qcom,select-utmi-as-pipe-clk" does statically, before the PHY switches.
> 
> Peter Chen suggested on v2 that the PHY could notify the controller
> instead [1]. This series uses the existing Type-C mux framework:
> typec_mux_set() calls each mode switch linked from the connector in
> graph order, and the controller (HS port) comes before the PHY (SS
> port), so no new PHY-to-controller interface is needed. The cost is a
> "mode-switch" property on each controller node. If a notification from
> the PHY is preferred, the clock selection in patch 2 can be driven from
> it instead.

Hi Joonhoe,

Thanks for explaining the trade-off in the cover letter, I may
still prefer that the PHY notifies the controller is better, for
the reasons below.

- The controller may not know well what the PHY really did or is going
to do:

   qmp_combo_typec_mux_set() has its own policy. It does not
   reconfigure while DP is powered on, and it skips the switch when
   the PHY is not initialized
   (drivers/phy/qualcomm/phy-qcom-qmp-combo.c):

	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
		return 0;
	}

	/* The mux still receives Type-C events, even if all PHYs are uninitialized */
	if (!qmp->init_count)
		return 0;

At above cases, no switch clock from PIPE to UMTI is needed.
If qmp-combo calls the controller right before it tears the PHY down
and again after it brings it up with the new mode, the controller does
not add wrong or useless settings. It uses the UTMI clock while the
PHY is being reconfigured, and goes back to the PIPE clock only if the
new mode has USB3.

- Once DT ABI is added, it combines the kernel code with DTS. It needs
to maintain both DT property (graph) and kernel code correctly, eg,
it also depends on the layout at pmic-glink node. If using PHY notifies
controller solution, it adapts for all related SoCs, and no dts
dependencies. 

Thinh, What's your opinion?

Peter

> 
> On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
> DisplayPort series [2]. The controller side for that SoC is a DTS patch
> sent separately to the Qualcomm tree [3], and Tapas Rana has sent the
> same for Glymur [4]. Neither should be applied before patch 2: once the
> controller node has "mode-switch", pmic_glink_altmode defers its probe
> until dwc3-qcom registers the mux, which only patch 2 does.
> 
> Patch 2 is on top of Filippo Falezza's "usb: dwc3: qcom: Restore UTMI
> PIPE clock on resume" [5] and reads the selected clock back from
> QSCRATCH, which loses its contents in system suspend on SM7250. [5] is
> still under review; patch 2 will be rebased if it changes.
> 
> Patch 2 adds "depends on TYPEC || TYPEC=n" to USB_DWC3_QCOM, so with the
> arm64 defconfig (TYPEC=m) dwc3-qcom is built as a module.
> pmic_glink_altmode then probes later, and a monitor attached at boot
> depends on Yongxing Mou's "drm/bridge: aux-hpd-bridge: replay last HPD
> status on hpd_enable" [6] to be detected.
> 
> Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
> backported to a v7.3-based tree that also has [2], [3] and [5], with a
> USB-C monitor that has an MST hub (two displays, DisplayPort over four
> lanes) and a USB 2.0 hub. On each of 5 plugs the controller switched to
> the UTMI clock 1-2 ms before the PHY switched, back to the PIPE clock on
> the next USB state, and the monitor's hub enumerated. After each of
> three s2idle cycles with the monitor attached, both displays and the hub
> came back. Plugging the monitor in during s2idle woke the tablet. The
> mode arrived after the glue had resumed and was applied right away,
> before the PHY switched (once with each clock selected beforehand); the
> path that applies a recorded state on resume was not hit. A USB-C hub
> with DisplayPort and USB 3 kept the PIPE clock, and a USB 3 stick on it
> ran at SuperSpeed.
> 
> Changes in v4:
> - Patch 1: add Reviewed-by from Krzysztof
> - Patch 2: mutex_lock()/mutex_unlock() where nothing returns early
>   (Krzysztof)
> - Patch 2: leave the probe code as it was apart from the new argument
>   (Krzysztof)
> - Rebase on next-20261118
> - Link to v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/
> 
> [1] https://lore.kernel.org/all/avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com/
> [2] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
> [3] https://lore.kernel.org/all/20261112113921.1143-1-26rote@gmail.com/
> [4] https://lore.kernel.org/all/20261117113834.925310-1-tapas.rana@oss.qualcomm.com/
> [5] https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/
> [6] https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/
> 
> Joonhoe Kim (2):
>   dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
>   usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
>     modes
> 
>  .../bindings/usb/qcom,snps-dwc3.yaml          |   5 +
>  drivers/usb/dwc3/Kconfig                      |   1 +
>  drivers/usb/dwc3/dwc3-qcom.c                  | 150 ++++++++++++++++--
>  3 files changed, 143 insertions(+), 13 deletions(-)
> 
> 
> base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
> prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
> -- 
> 2.53.0
> 

-- 

Thanks,
Peter Chen

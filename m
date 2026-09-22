Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CF54D4868
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077433; cv=pass; b=jJ69cO1LPHbQBJHS4+5thRNY1diE8RAg0UGdENDwZO14V5wq5BrQuqZ9lnZ3v1G4E8JGz0itV0kXxXousRmO47NdmtzpVaTBz8UGLis/8KC+x1gjCtHHaeKbtNGaE8ITxU/RgSl5q56HIA+Oi3aa7wNnJK04zXduONkgHw6SVTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077433; c=relaxed/simple;
	bh=kSDLKQ3fFz6Q2v+DGB/iXJKvLM0o4PsJsvctLJETZpc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BD2SGw7t1IL2iJydiqdsCJ5LyAJeBCp/LBXeuzwr9SjGL24hHnTVP6c7lSD89ZJqILSsOo97RPz2ZkSqAuEN/4wLFf4wckNZL5ydNCYTOfjGzEv5egQf3bkJwrXXTwutQkcYG2XUOJn3s6czPqUGnQmtsh6BryAPDo643I9SYLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=g5qP6zof; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=BCJ9Sxji; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="g5qP6zof";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="BCJ9Sxji"
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4hpysr71vDz49Pxq
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 14:43:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1790077425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDCJSXoI0WbQ0p3ihA1hkvhJFyDcDNp+TMZs8wSGHg4=;
	b=g5qP6zofhgjxQT+sz5cb1vi7PstYo2M2z8VqRrOIJAu2vZHbqB1jss9qRlmvwpdfInzPI4
	p/0pdIo7G+9pz8dbYk5n6aixlCpcxSeUZwW7hcLcq7uoaP0sL9CtU41IV0lOOIIf3mAubt
	9b4wj1DI0cWYmVujh/nmKfCd00ChRvkvusf0RyjUsnuMQiNb8igC2Nwn9LfQiQjeZs9Cun
	icuT8vsRwEvOJlqnn5f+rdKu1JJkuJLtyeYZylqGYPI+uh9teGlrXcd+8Yfn1EyXoDAQje
	QSO/LTNGkuGnHgge5n6x5DUd4GEZXEjuGXKr0EtnClZGDz27GwEkcnehyyUi0A==
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hpysb5nLyzyYL;
	Tue, 22 Sep 2026 14:43:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1790077412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDCJSXoI0WbQ0p3ihA1hkvhJFyDcDNp+TMZs8wSGHg4=;
	b=BCJ9SxjiX5L3zhiWqa5ACtN52xDuZIM0VvoHqy6VOfbRqyVTs9eRUAUdz9/m9qubxeVgFS
	dqvgDDyGvxq1wG0PIzQqOFjbHRgCd2A78eHNBp1uSRIiXp0czVaH9Nz/rAcVEjJDt0QlDG
	+PEbz68y7gH42FFyT6Xqz/OXsPFz8P8=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1790077412;
	b=vOXD8qHRpzpguhYhpMRx1e2Q/3rI/+1q3leSJumeMWL9RoJl0dxK6d6zcn3GNmDTxY9X+5
	662JjFXwAZkTmz7fUH1JS0+qG/MY+BjXJAcPhkhNXJwu6RjBmkFxVgBfEgasTwFT9km7pR
	HXNqJh9AH9W+sUko6KYCcsSaHqeQyJo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1790077412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDCJSXoI0WbQ0p3ihA1hkvhJFyDcDNp+TMZs8wSGHg4=;
	b=M6wNbldMex6eNUuqwyCGhH/RsDQWLPylr1A++xuuM4KQmMja8OcahPi9gpYzURAp8+qwU4
	3CewMnWDQg0bbUzChhbDO2vcu4S9SKyI5EEKgxPsBDQTIyQPY4miQQPas/M+skNa2wmIx2
	XT1Ko2wqXH2YR8rxgGIK0TzxKwQkQKw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 794151980062;
	Tue, 22 Sep 2026 07:43:30 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Tue, 22 Sep 2026 07:43:30 -0400
X-ME-Sender: <xms:32myatg49o2er3dLEHE4r7I9rXsYaGObsp32cn7WyFIZ8RMCdYb-qg>
    <xme:32myas0Xlzs7SINZs582WaVh3NHceaIt_mfkk9PrpgJZ0sjaIll1l3HZRWoRGBNM5
    BMbO2czBXLn0qo2YVS27LFjostcQP_vP4_8DYAs49WB2PTs8c47nfdx>
X-ME-Proxy-Cause: dmFkZTEtbiTwXaJq8lyTxx63pXM8gv6tRPzvjR2XlgYzsPY53oPiafl5LAiPT+3EqcPRxj
    v+lnvvbg4B8Av2KIvQrtjz0yr+Yq5f7CFnPLCrFT2IdzdKDplNdf8L8t7MZx3Cd/fIDKRA
    s8ZACR28W2YjgpG0ngf+cr56Qgak+Lbi068lHJIEZWBixODjiI1oxDGT4AxdKTzzYaJL/z
    jecy55fw/Ba0ydPGzUnkf7k8Xd2WKon0j+ZdBjpgyCnv5XBP0lEqPIChyId3c/E70ctqLW
    ezkbv0P3olAwKi8GjrrFnskjocGLPncShuhlmTHbIlPxm5wc+VsIYo4qDP3LRm60ZhxrRU
    UQG+3ayrCDzbUcm0I/qAM9LTWJXZLqJhUiHnvcCn0crK92EN48dWQbzKVxFWK6UqAYb1Ok
    cotm9QPvuoD56VyyhLXJxuknc5itdvROGsFq3e2LaFnjciBYsgDaDvCtROBhps7EwFg5dE
    yLxz9saybj0Ru87aZmKqTgp1073H2oEdLV/hJJyzVWl/UYJmvg8VxnM5+YaH6bI+BX9LBz
    Sm90ijWfu3nY/1tXOMQt6xMt4pDtaM+HwWxJhOXsXtI8DpmPoJNWIR/le2GLmSJBttPEBw
    E1lzIwDeQWRCwG40xq115NO2pqU7gWGrNVaNEVMvpzupOEaKf75gmaBS0r0A
X-ME-Proxy: <xmx:4mmyauydh2N1Y6AboU5ILm0kGpsGkeUyAWIrQk4BPNDxzZPh4TNfeQ>
    <xmx:4mmyakzt6yCgAfqi5gpyTsC75SC8YC0XdoVNMXRrxDjyOEwJJEuGHw>
    <xmx:4mmyatTu2-u8iMHX_oChV13_xnlwREiNIeABWz4ReB1xVEqwAw1YGg>
    <xmx:4mmyanPvEyQ1Y3PO_u0I9QwNqDtPpw7x5Al8EF_ZHOmQ-sgIRRqFlA>
    <xmx:4mmyaoSJYJL9gXz42aPZALcY5cbEB_PMn2dlcjywAGEGIDjHliwnWCCo>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6F7D7F80089; Tue, 22 Sep 2026 07:43:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AtmlxWozq_rN
Date: Tue, 22 Sep 2026 14:43:05 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Chris Lew" <christopher.lew@oss.qualcomm.com>,
 "Deepak Kumar Singh" <deepak.singh@oss.qualcomm.com>,
 "Raj Kumar Bhagat" <raj.bhagat@oss.qualcomm.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>
Message-Id: <e7e8a499-9e89-4efa-a99f-18ce7dc37ab5@app.fastmail.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-4-27dd80d841a0@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-4-27dd80d841a0@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] wifi: ath12k: Connect to the QMI server belonging to the
 device owned by this driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 21, 2026, at 14:23, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath12k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.

Tested-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Tested-on: 2x WCN7850 hw2.0 WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: 1x WCN6855 ath11k + 1x WCN7850 ath12k

I'm having some issues with regdb on ath12k cards so I had to test using
the low-frequency 2.4GHz channels. I tried updating linux-firmware to
20260810 to match my 6.12.110+multi-QRTR kernel, didn't help. The error
is:

ath12k_pci 0001:01:00.0: No reg rules available
ath12k_pci 0001:01:00.0: failed to extract regulatory info from received event
------------[ cut here ]------------
WARNING: CPU: 0 PID: 12 at /drivers/net/wireless/ath/ath12k/wmi.c:5841 ath12k_reg_chan_list_event+0x171/0x1e0 [ath12k]
Modules linked in: xt_gmmark(O) xt_bemark(O) w24e2identificator(O) qrtr_mhi ath12k mhi qmi_helpers mac80211 libarc4 cfg80211
CPU: 0 UID: 0 PID: 12 Comm: kworker/u8:0 Tainted: G           O       6.12.110-yocto-standard-gec77603762c7 #1
Tainted: [O]=OOT_MODULE
Hardware name: Freescale LS1021A
Workqueue: ath12k_qmi_driver_event ath12k_qmi_driver_event_work [ath12k]
Call trace: 
 unwind_backtrace from show_stack+0xb/0xc
 show_stack from dump_stack_lvl+0x35/0x40
 dump_stack_lvl from __warn+0xaf/0xb0
 __warn from warn_slowpath_fmt+0xe5/0xe8
 warn_slowpath_fmt from ath12k_reg_chan_list_event+0x171/0x1e0 [ath12k]
 ath12k_reg_chan_list_event [ath12k] from ath12k_wmi_op_rx+0x219/0xc08 [ath12k]
 ath12k_wmi_op_rx [ath12k] from ath12k_htc_rx_completion_handler+0x215/0x2d4 [ath12k]
 ath12k_htc_rx_completion_handler [ath12k] from ath12k_ce_recv_process_cb+0x149/0x198 [ath12k]
 ath12k_ce_recv_process_cb [ath12k] from ath12k_pci_ce_tasklet+0x13/0x28 [ath12k]
 ath12k_pci_ce_tasklet [ath12k] from tasklet_action_common+0x87/0xa8
 tasklet_action_common from handle_softirqs+0xbf/0x1b4
 handle_softirqs from irq_exit+0x55/0x78
 irq_exit from call_with_stack+0xd/0x10
---[ end trace 0000000000000000 ]---

This error happens with 2x ath12k and 1x ath12k 1x ath11k too.

But, the dual ath12k setup works, and the errors are entirely different
than what QRTR node id clash does.

So, I believe the patch works.

BR, Juha-Matti

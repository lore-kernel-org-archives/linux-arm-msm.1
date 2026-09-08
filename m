Received: from mta1.migadu.com (out-132.mta1.migadu.com [95.215.58.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3275908A7
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 22:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906808; cv=none; b=a9qyodNSs+VAfmVQnjvHMQxp4P3Z/cikBF0cGG4UOCkgbSID1qUG3MuKn5o6SVNPAlsiUBb/CXsUKeytnxMU3lyyGEZT1PCWpnAx/9vQgB/F4PfUxx1aR6AdChSm4AZogWGS69BCd9TEqqScx22jMbwU6AkN5847Zj9hAlYVOwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906808; c=relaxed/simple;
	bh=ggsLFN/yxhA2E+Ba5cw6K4KPDI5QBxHyAYW1tqsbF70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hju2H+9RoeMDPvqEWA3Pe//8TGLa091/mWTWSN5/wNN/uaegpJXSuh4/IpQg7HiuPNDEJ25fB8eG4eCEEYUkAEpjR7scV3B+NKemDVhL9t+JbEUNngqnChEJXnbdXRzT5bmzTPbqK0v60KQdfnHUxIy1iJuP5TcrqDCzXcbAPvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Uf1cAa4L; arc=none smtp.client-ip=95.215.58.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Uf1cAa4L"
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ggsLFN/yxhA2E+Ba5cw6K4KPDI5QBxHyAYW1tqsbF70=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788906800; v=1; x=1789511600;
 b=Uf1cAa4Lx919MGmj+ttbgdcm38NGasauk3/clI78597jbxv1O3/+yD4XAJIodcqpXgxxoRtf
 35ABNnm4WHD8RHzRN+1jS9WwjrfsFDfp2nrKdgPB8i/rcE8uyw16LeigeuBh+A7o8098y72LDWW
 OOKzff/sYmtz+L3mlBsm6C9680l/PAadH5XvSigTHJnweH7rHLSZgx2E7K4AiPPVbb7DZZV0eOF
 PDqr4KJ+xWPn/h5rasB3i3gnkakuEHWdTyqMkqHHpLbezYi4hmxl4nVphzCM076Lis3l0BBdZlH
 Lzygs12AyrwJGxYT7fh02h7TCUeYc6sFAWhtULbvLkRrw==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3aad00baa8fbe95f;
	Tue, 08 Sep 2026 22:33:20 +0000
X-Mizu-Trace-ID: 3aad00baa8fbe95f
X-Migadu-Flow: FLOW_OUT
Message-ID: <cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool>
Date: Tue, 8 Sep 2026 19:33:12 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/23/26 7:54 AM, Krishna Kurapati wrote:
> DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
> If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
> exit is done only when roothub is being destroyed. Due to this, during
> system suspend in host mode, although phy_exit is done by DWC3 core, the
> init_count on phy is never down to zero since HCD core also did an init.
> consequently causing phy's exit routine to not be called. Hence, add
> support to skip phy management by USB core.
>
> Some Exynos platforms still do rely on USB core for phy_calibrate calls,
> hence disable USB core management for Qualcomm platforms only.
>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Link to PHY calibrate handling for Exynos platforms:
> https://lore.kernel.org/all/20190829053028.32438-1-m.szyprowski@samsung.com/

Hi,

this was merged into -next a few days ago, and I'm seeing warnings on 
boot now:

[    0.613188] sysfs: cannot create duplicate filename 
'/devices/platform/soc@0/a800000.usb/software_node'
[    0.613195] CPU: 10 UID: 0 PID: 93 Comm: kworker/u49:0 Tainted: G    
     W           7.3.0-rc2-next-20260907-uwu+ #143 PREEMPT(full)
[    0.613197] Tainted: [W]=WARN
[    0.613198] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[    0.613199] Workqueue: events_unbound deferred_probe_work_func
[    0.613206] Call trace:
[..]
[    0.613226]  device_create_managed_software_node+0xe8/0x108
[    0.613227]  dwc3_qcom_probe+0x5a4/0x7b0

There is indeed already a software node being created in the shared dwc3 
core code.

Could there be any other consequences than a duplicate sysfs path?

Maybe the property should instead be added to all qcom device trees?

Thanks,
~val


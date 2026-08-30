Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD313B42F4
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 15:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102137; cv=none; b=PsUBrEqKRI/aZ3ixUXLpv1agVDrO4LbGfmTa1DSnou8WV1vUDGf9AjFHJ7ZCWbYyWVD4Kq+YSl/vusU3ZhhJ7gYZuEAlW59GC7A6cu8ZcGN2HUoYpsLtn3zQ80AwNgjOb4K7ybpKoggx/I4V5avQW25YUKElL6ZYQtdeWkYER0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102137; c=relaxed/simple;
	bh=XUVWVuQrBdxE3yJL6IrorJDrHmI/gREoXd5KkUagmtE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J2K5i6iqgOiEpNNZyZvFWcC90/n7Mjd4VsIZOZMfd8NknxVfMAwwRAiD5LWOdSmC/EhqtYBgaMSmpICiScMXb/XVaa49nWBbEnT94g8+CKAjz5K49ONu4XLtlVMfY+FnRbcLyVMucvi55IihXJ/8I+/AAmweccpA1ltJh1pfBIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9TNv89P; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9TNv89P"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so552995e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 08:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788102132; x=1788706932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AxDJBHK8GZ5nWALr8EBSgszbwIyzo9ArpXjhOeVOR6U=;
        b=h9TNv89Pvbc6RtR020OqhzFKnXJ8uwNHwi9cXFw+xsmj3YMmK5SSwT/71H4sgJv+ki
         fCLamYd5oJCb2nn7AIwx7iBaX3vnScNT/TXrdi30U10AFUV1vK80mmf1EusZJOFuX/Yf
         AArwzZ4+3nceECBiIcSX7KfkMXAl3xXiCHFwD9VIy58TUIwX9SmQR/EpnT1cCgwyHgbO
         ciQZgdPHDIwEgEUi+PHeMCG4ITiJIXBHxzLw6GRns4Bz3GavpLxG1qyzjQzk8WZry3ak
         hQO8mZJf5rmkpqqqrdyno8kWk2UJdqFnI9gvqTP8OzL8TuDAZXHi3R8PZjlU7Yfi3GY3
         WcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102132; x=1788706932;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxDJBHK8GZ5nWALr8EBSgszbwIyzo9ArpXjhOeVOR6U=;
        b=YC9QR75DwCMmYKmVyRVk/3Q3WvMmgNcw+gNdzvN1Vdr18bxske8OwujgQpDhjZpgYQ
         7A7DoN8rX8/dWrYgvMw1VI65ryBO/3fYUWWMmfsqWAatoMUEIV2WYk8lBRSTmrxVNiEk
         2NHDS1AftnXPRjSbh0r7pyY3IyZGnUZVR4ELqtqi7iTYNGu2fBVQ1jhYsEEUFUmE2V6l
         foWVRFlZpyuQDDwM2ZMQcBPVD4Egfxyr/rrh4ea0I1aqk69UhgaLk0IwIHfNG3ZJg0ji
         Q/1T4NBNkzKmMCUUlIUs83d8L+KPAcY9fud5FlAdC2Usvqioi/EZ+FcjIuIHPwZKrMLx
         K+Pw==
X-Forwarded-Encrypted: i=1; AHgh+Rridms/6FQNEi3cRnbZ5OXUQAYfotlgeUxKpb78Pz6sZW/eMVd7xBvfcPnDWCaRf5Q9+RjMZZVlkLuVapcB@vger.kernel.org
X-Gm-Message-State: AFuF++kImQrLPM+oSQ1pIuDGXmZYbaakSeeaw4anPeOgN+k/aDZ2v01T
	TnxfjinHWVDfsgGLCN4JWz39pVtEiC7YoqxndatuaX71J4ht2spS96dk
X-Gm-Gg: AR+sD125CuNPkZfprtMs2VZs81yV5CEHCHjH4e4Vh4NBK9j+B11Y3RhtZ+DwpsJMTW+
	xZp/Ns1A2EvAjqpFj6VV6R/hgfqgBzaXrpPVrn4d3KQxfHXtQveFyT5WZ0HM5Kz9WvwW4E+Euen
	Suyv4XcAuhQzKUrFnFRq11Wp7toYH/C8DKsVPB/qpaKEoXcclgbRT8IJl5ZuW8jAvhlZdBVcANa
	5A98J4SexBawiYMWN+p2QuW+oHIlJ/6TmE4yS+Fi/C3zrqm40I6W1rGVb1IMtLG11GZ38O+ZcXL
	ybn/DjZZTI3ovAz7MNh/RNp1vZCDey2mGEVssp+nlWUlEHQNec2TwxQoN9lJuGRh3UhCzzPhQ7j
	Nu8AnIpWDslFwzmsHrGC4WF/A4hi7YXxcnsdgW4+pgBT29VmRQqzAJ03aYbIFuBvnLosUUFND3f
	X3gAMXTJVbxx1KtemjGGWxgnzZkibhA2dmkzeomgLTjMWHw4Ane0MJnz7vmSYO0kLwUAM=
X-Received: by 2002:a05:600c:37c9:b0:49c:cedd:65b9 with SMTP id 5b1f17b1804b1-49ccedd661cmr149983145e9.16.1788102132121;
        Sun, 30 Aug 2026 08:02:12 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af45sm7203457f8f.9.2026.08.30.08.02.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 30 Aug 2026 08:02:11 -0700 (PDT)
Date: Sun, 30 Aug 2026 17:02:08 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Cc: linux@divinehawk.com, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
Message-ID: <20260830165934.34e5b82f.michal.pecio@gmail.com>
In-Reply-To: <20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
	<20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Aug 2026 22:04:10 +0200, Matt Eaton via B4 Relay wrote:
> From: Matt Eaton <linux@divinehawk.com>
> 
> XHCI_NO_SOFT_RETRY exists for hosts that can't perform xHCI 1.0 Soft Retry
> correctly, but it's only reachable from xhci-pci, matched against two AMD
> Promontory PCI ids. Platform hosts have no way to ask for it.
> 
> Add it as a device property, read in the same parent-walk block as
> quirk-broken-port-ped and its neighbors. It's opt-in, so no existing
> platform is affected. The following patches set it from the dwc3 core
> on behalf of hardware known to need it, rather than from devicetree.
> 
> Needed for the Synopsys DWC3 on a Qualcomm IPQ4019, whose command ring
> wedges when a Stop Endpoint command lands on a just-soft-retry-reset
> endpoint -- exactly what unplugging a device mid-transfer triggers:
> 
> xhci-hcd xhci-hcd.1.auto: xHCI host not responding to stop endpoint command
> xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
> xhci-hcd xhci-hcd.1.auto: HC died; cleaning up

Hi,

Does it still happen in current Linus tree aka upcoming v7.3-rc1?

Similar problem, limited to the specific case of disconnection from the
root hub, was found on Renesas PCIe controllers (it looked like some
internal power management interfering with operation). It seems to be
solved by avoiding Soft Retry on known-disconnected root hub ports.

Regards,
Michal

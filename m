Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785640;
	b=mlOWG+wpkYRR103MSIdMmhOeGpvgXqJhCSWu6HUIRdVic0+8Rmf6/bg5mc09vrFDYISY
	 jbrsOiOWythkE6j7C6uCipb9WqhR2VvQ0gMnUuiUR9QtSB2jTxHciz549TceGmM57IvSe
	 FXQ/U9AV135HW1V79Y7pYdHe6onF4JilpWGV0kMMav0MyK5StcISIAEcG8xHFi/LG3VLN
	 7poCbdoiEvjLteEZU9vbGlVVNvvfBU5KJTC/UzjqjFLuo6q2DjI615teJPVcI8GL4C6xF
	 wqzxpMV0CuvZ2oSwgj2nU/P4oK8dT5oh7RVMNQ03kIvjGiFaCfRum+RQ5CJh+kCXLJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=D+C2WErvkSsOZ4sk5Sz5TIE03pd4kWi86iFdjsd0GLA=;
	b=1HyCXmClmZ1lGxE53/5N7t6TuyuWVZ2ikLncoJI6YKyA/3Ar/iZja86o7MlWLTqqPj1g
	 UWcss2w2sWBdn7RmULM4zQD0ZZT/Sd/ci2ZdquTUZds7XKO29friiLHW89h1I8tr1Sq3b
	 Pr/4p8gfdFyDOjb/b0b1kSXH42XCh6FzZBpPP1JOB7Ah9d+B4bigjMG8xPQlycBNV3Xzm
	 GVwjlQon/WS9cNWwehyPF7UfAE7H1sAI/7Y2l7BkMR6DrfuNMRR8FNJD9Ua6eht/U5KPk
	 CiGKa6Z9K3YtsH/pwnYhfvtsAEX/lmawQ99xYMAjYkwQWJ/aUCCOlCAVfLJNL9h5kXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L82fFvNe;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64A606A695
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A64A606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L82fFvNe
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3edaso5509928f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785632; x=1796390432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+C2WErvkSsOZ4sk5Sz5TIE03pd4kWi86iFdjsd0GLA=;
        b=L82fFvNeBuBbQ/UMiY0am5fSBNG8SHGYx7cS8n0cxl756hwrwwxPjEKnz26xtxl3Mh
         eZBy+hrCagwNOc0a3JyD8PvO/OAmJlF9nDtvzgOT4Qj/ge+DUDfW5SAtMtZ1sX+O9gEp
         F+OuP+4KbSVL9LknpvmjVKW/5F25yRKHohDDsmL0w+Ih22/JWu8HGMRtTrZSsA+u5obi
         FWG0fSR64lQXRnmUyEg3DEATLthFGgdr9DMMmqInRgYeS0iLvJgbfIcag68nBIAeUgHb
         ayhfqMG9qgk7IGe2TAXnS9enVaIkP4aGVJi6n5jpY4kOx8/qlDQaPJYNJpGYrHWPz6dO
         JxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785632; x=1796390432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+C2WErvkSsOZ4sk5Sz5TIE03pd4kWi86iFdjsd0GLA=;
        b=HNsBl0sLh11hsFwiVC/8F9/+posTsf6/rprH1eF+XpfioHkPM1R3SlFeQ6sNJxLlkt
         oRyODa/NOoaAxL8pYcEFV9MUc04reClIbI2EgIopku4vT5abS2FDhXxWk+4etYhhVSjT
         udcgH2zAV7W6L/9fRfoOK8LJ/OXHu9rFj/UCCNTmlj8ZjSgC9DmgXA0IRHqRfZeC8HcB
         CKiCkn7BlOWTdiTHnUUDpvle6D03mto88DWt1lRQmStoPBUBgkJscmHulRl5rutsccBX
         hTz0O88tZBAYxVBHjiSCwieY79uCO+j5ud4kxTCh4+ef5qdtO3VjwZG+iFDYObcJ85fW
         NcBw==
X-Forwarded-Encrypted: i=1; AL+hErFgj2a2ol7f5zo2X5e/KOG+Bofq8yOt0aiB5kVXGKL6UujoxXOZiMaiaWEeeTqsium0bN9p4aDHFa3S5bgY@vger.kernel.org
X-Gm-Message-State: APuU4Z/07pAK4a07w4eD3fOxqVRDl3lxH5TascNWEtarD1AHVHJF/JCd
	2P1ylqR9XVSkVk8JHKwt9EGMuNOHKKpX789K66cfwM2E1rIbj0KOAaKb
X-Gm-Gg: AZFdTZcx52gdH+ix+0czCpQFX0YKl7rGQhKmPoCdp/2rynsBe0BQUOKxCWBFgWo8d++
	FTF19XENio5XWUKP8R//hWBeJ1z6suDczsYsxgKBVk+CCVWLLVD66FVnBmHqNq7EqI9q8bpEvJM
	UONdLrxo7RQIf1fEUPzhzlJ4GM0uMU0iKUrcDO3nmQMXHLgbEaMz2uHMmpT5EZs8cYmcoXDi+kb
	ZCrgONqOIuXAtJhwa955RVtw1OV5X1FT08jEma5a8AsadHHyIk0zJvrV4rPajpnPNPbZDV3HOnX
	1+2TOXouquYL34eCNdBu8YKTjlOjJFtlGT/QqdjgWT/EV6n90UgUaYpKIBnSx4xlP+HLSBGn8hM
	6c3jeawKVbuJ26D8ZRMnZqxA77DXEwFQnXBDD2wK0sk7D8px5N/KaQG9afrHYKDdoeJ2vCrcJfc
	gHpe/pyx6FlQ2VBM1VfEVCaCi1HufHuDRtwSi+o27LAXIbmUHPbGBrvA3AzGHqcK8OqETHUP7NR
	DNBo9GHQj2+PQZwyCNhicNz9TL9b1T4P1vTjFX/nHNeFWh3nNTOTeTTFKO7cyZDeVMQ7A0o6fzc
	T1HE18ZnVzO7OPEiDnkXhuYwh7ZxHGvJedo=
X-Received: by 2002:a05:6000:250e:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4aa5805e1e3mr58576532f8f.21.1795785631616;
        Fri, 27 Nov 2026 05:20:31 -0800 (PST)
Received: from gmail.com ([2a00:1bb8:11c:ad4d:e281:a398:d85b:8a2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm48315205f8f.33.2026.11.27.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:20:31 -0800 (PST)
Date: Fri, 27 Nov 2026 14:20:27 +0100
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Flemin Jose <flemin.jose@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] virtio: Add Qualcomm VirtIO transport wrapper
Message-ID: <awmAScxDZqR8GRy5@gmail.com>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
 <20261126-jshekhar-qcom-virtio-dcp-v1-3-7b49bda74916@oss.qualcomm.com>
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
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-3-7b49bda74916@oss.qualcomm.com>

On Thu, Nov 26, 2026 at 11:54:01AM +0530, Jayant Shekhar wrote:
[...]
> +static int dcp_virtio_transport_suspend(struct device *dev)
> +{
[...]
> +	ret = virtio_device_freeze(&transport->mmio.vdev);
[...]
> +	ret = dcp_ipcc_enable_irq_wake(&transport->ipcc);
[...]
> +	ret = dcp_ipcc_send_power_notify(&transport->ipcc);

Hi Jayant,

I've been trying to review this patch and got a bit confused by the
.suspend implementation. Why is the notify needed here?

The rest of the code seems to imply that a power notify means "wake DCP if
needed" (e.g. "It wakes DCP during power transitions" in virtio_qcom_dcp_ipcc.c),
so how does that fit into .suspend? Does firmware treat the power notify here
differently?

[...]
> +	complete(&ipcc->power_notify_done);
> +	if (ipcc->resp_vq)
> +		vring_interrupt(0, ipcc->resp_vq);

As far as I could tell from your comments, rings from IPCC (separate from
power notify) are needed when resp queues are ready. But why if we already
have a virtio interrupt? I kind of assumed that this is what was meant in
.suspend when you enable IRQ wake, that we may need it to wake the host,
but while suspended the queues are already deleted and resp_vq is NULL?
I think this also addresses the race Sashiko reported: this seems redundant
or I don't understand this mechanism fully...

Thanks,
Stjepan

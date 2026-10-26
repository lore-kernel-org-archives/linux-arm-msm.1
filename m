Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.235.229.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024477;
	b=kCl5iu0kB6sriWyTF8VFGSkFalF3LYt9rCNf5ovBY9C20z6f7VgfC2ipt85w951g8d6a
	 NapL5zBBbX0bCq/cQcSmOF4w5Z5CTXBPUQpem8Abk45nPXzTZ7oMZ00gEN/t+Yy+0IUEE
	 cvqKY3XML9Dv9tzurQ34IN1APfCIpYcd8kAJ0UDmCfFxhcuQSB5EZbRd9mRgbWG6FCBZr
	 t4SyY6gBEXkmrjyI5fHM3l7cw+6hDnhCjq2vMnz5xJBx6WiAE5N5w2zfneK2m6+gnUWNw
	 C0HnK8+gbkg12pvZskM3G00CVeRYWE3Idw7Z2mHZRJoTkDod8dGV6n5CFUQ/MidWVIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024477;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Chocolate:X-Operating-System:X-Uptime:User-Agent;
	bh=tYzlrVYBC+17hPda165CE0ynYFo6G98Os9qHRyvkCEE=;
	b=O+yqw6WTo+bAzz3moWABVi2d9mOnV3TIJGF4wcLK1cARs4AQWRPm4RNh4ySCfOhP5emD
	 9+YxI4MGD7OJ4csmCCLjD/jjL5SXzAWTaF/JSKw9J9ZmrvdHtY/8EvHvkvrcJ1WKOwc4C
	 9JVep6BelAjVMC/DiEujqwprEbg463unPnUdi2ytKDymy8h/1/oKH2e9csuhJfljCIp9s
	 Pfn/gloocNvZiMk23DICBYmEjEmdI5b5PZ97W9lOEXPW4nIeNgse7dNHS6u58glVmCg7s
	 BcWdPPXnFNA/NQNvBPzbb8UD7VDFREi78XkiZnb6C14D5IrwtklWxV0+llKMFI0a7eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=treblig.org;
	spf=pass smtp.mailfrom=treblig.org;
	dkim=pass header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=VGWSt4bU;
	arc=none smtp.remote-ip=46.235.229.95
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE115606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE115606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=VGWSt4bU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=tYzlrVYBC+17hPda165CE0ynYFo6G98Os9qHRyvkCEE=; b=VGWSt4bUbhwjLgYm
	eIX5RnQsyqwfW737TuhihlWca7BW0U7JaO5vhV6v9IEePLaQ3O3sITFqt6I1CRg7t73YtfUEXnPM6
	2fwzaxj9D+Q399Sf6ubnw6ttNhfXGjknJaoKon4hIL03yLY5yQiV44nclYaKhxa1c4RoBPEho8Dav
	5Pf3cW8cjBJhe7RAO4ONCw1/JYfxv78RRDAHh1nDvqfu05jNqvpGh2gA3oAMF7Jqi2PljiHWSNNeK
	o0UucGbPYmSfwLAP4Z3Z6sjHXKvAOcap+YXnnleua9hBww7aSVolu00jSTIyZ9eqh8MOdPbTf2u8r
	gwejqUkJ2YOZPgGDXw==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1xLLZU-00000002pRA-2RaZ;
	Mon, 26 Oct 2026 14:21:08 +0000
Date: Mon, 26 Oct 2026 14:21:08 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: krzk@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: Tips on tracing bwmon?
Message-ID: <at9h1AahpJj-r7Ti@gallifrey>
References: <atd6TRv4HQApcPvY@gallifrey>
 <87e38bda-7ec2-4b7f-84c9-29a837696572@oss.qualcomm.com>
 <atn3FAF-3GHPgvad@gallifrey>
 <e88b5617-2463-4639-af85-0d2d5e3df6ec@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <e88b5617-2463-4639-af85-0d2d5e3df6ec@oss.qualcomm.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.113+deb13-amd64 (x86_64)
X-Uptime: 14:20:58 up 9 days, 23:41,  2 users,  load average: 0.02, 0.05, 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Konrad Dybcio (konrad.dybcio@oss.qualcomm.com) wrote:
> On 10/22/26 1:44 PM, Dr. David Alan Gilbert wrote:
> > * Konrad Dybcio (konrad.dybcio@oss.qualcomm.com) wrote:
> >> On 10/20/26 4:27 PM, Dr. David Alan Gilbert wrote:
> >>> Hi all,
> >>>   I was looking for some tips on if I can use bwmon to see what interconnect
> >>> bandwidth is going through the dwc3 usb controllers on my x1 based Asus Zenbook A14.
> >>>
> >>>   I've got usb-ncm gadget wired between a pair of them and I'd
> >>> like to see what stats are available;
> >>> (See details of my gadget stuff setup in
> >>>  https://lore.kernel.org/linux-arm-msm/atJn2jfI_cZy3UMo@gallifrey/T/#u )
> >>> And that's struggling to get much over 4Gbit/s over the network interface.
> >>>
> >>> One reason I'm curious is because the dwc3-qcom glue sets an average
> >>> and a peak icc limit, and I wanted to know what the difference was and
> >>> what the type of timescales were for how long it allowed a peak.
> >>>
> >>> Are there any docs I should look at?
> >>>
> >>> I did:
> >>>    trace-cmd stream -e icc_bwmon:qcom_bwmon_update > log
> >>> on both machines and during the run I'm seeing events on exactly 3 of the
> >>> monitors;
> >>> 24091000.pmu, 240b5400.pmu, 240b6400.pmu
> >>>
> >>> (In the numbers below I've grepped for that monitor and sed'ed out
> >>> upto the 'measu_kbps=' part so I can then sort on the meas_kbps)
> >>>
> >>> My reading of the interconnects_summary is these PMUs are
> >>> somewhere under the llcc_mc@interconnect-1, and in some
> >>> cases under both chm_apps@  and qns_llcc
> >>
> >> These BWMONs only monitor the CPU-DRAM paths
> > 
> > Thanks for the reply and explanation.
> > 
> > Are there other BWMONs that should show the USB path bandwidth,
> > and if so how would I watch them?
> 
> Unfortunately there aren't.

Bah oh well; thanks for your answers.

Dave

> Konrad
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9214582D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984294; cv=none; b=M6oVm9UGzo2DzOqEwAkyX4YnQcs9FQeiMYn7Encl0BDc9jRGrSzs974+EwPjTwv2z2uOLQpNzXj3EWQwRK/zf3e5eRLCcJ2BV89UHlwniPEoRc7ncbAEVFkXaR0oRt8tUPxvE2Xg6Xg+yab/ZLN5d7PJ9IRi4fQkHmvnPpx63Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984294; c=relaxed/simple;
	bh=R9F7eCs5hlVe0XrQOYg+00J2R1c/rmdJwPU5ijIE2p4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/9idE9cU81SZjgamBVBa3nh6thJbfIi9ShQ6AciiovYPlc5vfqPUMkdT+I2e+cAgkArQaMNozcj4fB5vXFR/Ssy8IaUN2IJVCcDeJvPeMeDFeWtW5MXQ/dMDo0QESVol6xNp1ZZf3gdWt3+OPIq2euWGc17mtJlDgsZ/mbawHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0w6cxpR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0w6cxpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893011F00898
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984291;
	bh=R9F7eCs5hlVe0XrQOYg+00J2R1c/rmdJwPU5ijIE2p4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=J0w6cxpROIX6TE4J6DIgJu76eJyynKDstTTr+tfblPFjw2DpF0VReVyWoC8LMaHGO
	 r1/PyRV3pBHDz2rfJkTnrbV1korY59q41VfoZZ3HWiHwYt5oF0nV3BLMA1e2xLmXSB
	 mkU5CfqPdkI94cNEUd7p+fiS1Z1bEI0Up8CZzMk+QIgu/atRjd0/F6za9Gwv4ObiE/
	 ET3v/p9ig6JEpn4PNtqCU/y9HiM52wJQqzDPgQDLFz8e5klse5Dp+3S+3/ucCIDUnW
	 0bBn8c+UEBJA2Ika5GCuU4YTXyn9buv3OkjlGYZph77CSkHoka8ezapPxlziSh9+cG
	 RbipTfsze7Kow==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so2524080e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:51:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUeOtUQfKegxNTBXRrWZOFSsOm8V7Up3esXr8J1ZzZFSmZhXknUAGZetqjpSuu4bU1XbcRWvv9UZG81rq2@vger.kernel.org
X-Gm-Message-State: AFuF++mb3JlkT1QuAsD9CNsS7CifpIKhi3J20cxcAjmu6m+zNrE8Uqmh
	AgQEYN2J6YhbG4mNfrFuLjKYRI2C2Xidn0tzw9532Hw+esQDSmnM0WHJJAJfTjIIRJM2DCxlzdL
	Q4HUmBgEYC1pIXhXmyMYzzEv/Cm8ar+Y+Bs7cAkpkrw==
X-Received: by 2002:a05:6512:4023:b0:5b6:1a7c:fd96 with SMTP id
 2adb3069b0e04-5b8c197532bmr3127147e87.60.1789984290166; Mon, 21 Sep 2026
 02:51:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:51:28 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:51:28 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MdHy6M9cY-ZqMXP_F6yLuVuipDkZwHoBF0D9W3A5VkOSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-pci-m2-bt-rework-v1-0-3c7d9cf9c010@oss.qualcomm.com>
 <20260915-pci-m2-bt-rework-v1-3-3c7d9cf9c010@oss.qualcomm.com>
 <CAMRc=MdJgXDUb-Uac0TRB8u1WUpLng51C4yMH6iMEMoK56tQYA@mail.gmail.com>
 <p2qiwwig7ap74puja6mgnz37lofljhexiapmpp6y3xmwkhs2dn@v2mxawoivkn4> <CAMRc=MdHy6M9cY-ZqMXP_F6yLuVuipDkZwHoBF0D9W3A5VkOSQ@mail.gmail.com>
Date: Mon, 21 Sep 2026 05:51:28 -0400
X-Gmail-Original-Message-ID: <CAMRc=McfFtRi_kwPh6Dfz6MwGEy_Q7ojFmJ3ibJ6V4PiEDPetw@mail.gmail.com>
X-Gm-Features: AcwNN1XisqOT1G4P_pz-zd8sYeXwsQoqqLC2dtscBpTlrZOqZnjSykzHCvQdieE
Message-ID: <CAMRc=McfFtRi_kwPh6Dfz6MwGEy_Q7ojFmJ3ibJ6V4PiEDPetw@mail.gmail.com>
Subject: Re: [PATCH 3/5] power: sequencing: pcie-m2: Create auxiliary device
 for the M.2 BT interface
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rahul Samana <rahul.samana@oss.qualcomm.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Amitkumar Karwar <amitkumar.karwar@nxp.com>, 
	Neeraj Kale <neeraj.sanjaykale@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 11:08:58 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
> On Mon, 21 Sep 2026 09:58:27 +0200, Manivannan Sadhasivam <mani@kernel.org> said:
>> On Wed, Sep 16, 2026 at 04:19:16AM -0500, Bartosz Golaszewski wrote:
>>> On Tue, 15 Sep 2026 16:24:04 +0200, Manivannan Sadhasivam via B4 Relay
>>> <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
>>> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> >
>>> > Currently, the driver instantiates the BT interface of the WCN6855 and
>>> > WCN7850 combo modules by creating a devicetree node at runtime using an
>>> > of_changeset, with the compatible passed through the PCI ID table. But this
>>> > method of creating a devicetree node just for matching with the driver is
>>> > not recommended.
>>> >
>>> > So create an auxiliary device for the BT interface instead. The serdev
>>> > transport is still allocated here and handed over to the Bluetooth driver
>>> > through the auxiliary device, along with the power sequencing target used
>>> > to power up the controller. Also extend the provider match so that the
>>> > auxiliary device created for this connector is matched as its power
>>> > sequencing consumer.
>>> >
>>> > Since the runtime node creation is now gone, select AUXILIARY_BUS in
>>> > place of OF_DYNAMIC.
>>> >
>>> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> > ---
>>>
>>> That's some nice stuff, thanks for doing it!
>>>
>>> It looks like there's no build-time dependency on this, only run-time? Can I
>>> take it independently?
>>>
>>
>> Yeah sure!
>>
>
> Nevermind that, it still needs is_controllable().
>

Patch 3/5 also needs the header patch 1/5 adds, so we'll need a different
merge strategy here.

Bart

Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749483BF67A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787156749; cv=pass; b=c34pLO/+E5S6/iGJM7OlztPKtr1fFL/+PPacw8PUID//byHWsKwx+X9cn1QtODNU2UGaz/xa8wxcUco32x04wbSrKgs9lnFNnxpA/hHhFHx+UtN0hdrpgXptC7b2/8ireytw4seyBLxKKhtbtSsCz0w1PwGxM4NW1CcV/7BgerE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787156749; c=relaxed/simple;
	bh=QTZ8swtijkfVi+YJxPypjtVivCBfWnCvFhHDw9Uxp70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSbOHzfSnwBYnulmcp8utAtG86aWMsAS5BFYLLoydf/GFBA6rmy2PuhpWqBueZy852+VQ1ZfyTArXtI2+48eqHDsKxW0/mh2jJoDXG7ByDc7SV+Kmr8pucDe2nMGgaGsyT279X4zK58VU+gMikBZEsYLIfUxQxKCOznodVLleWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzCm3Q9I; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzCm3Q9I"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80c5cb9a888so14761157b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787156747; cv=none;
        d=google.com; s=arc-20260327;
        b=CW9T+ZIJnZ7UfJ1dCV0FKBIVjYp9f+s6t3nfHZQMIv53cEYSMD5Ad/i1PB2fV8U7bX
         D+h+p5WsN9i42AkDSf6F7loEhSGlUhKwjEjEp9NZ/E7Vaco2/rxxM+Wm8m50QBQTGSzV
         7C2LTfXFKYA6+tSp1LJ2y4fHzKUZ42mDd+j7jx+8iXu2lZYBu9XDU9lB4Lg0V3ylSDjS
         tJCcLdrDAqWo1651BxMK3mkb2rsz8tsxml/w3IUTs2J7JbQso5gnnQjWaWjh4EH19C+L
         aTxfQb9U+i8YDoQTuTHFtzajBlf0sC5XB+xWRyT2WG8PNM7U7DBE9Psp6vEIwOBGTzrw
         rdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W5RCTORorN4Bf1q2o7H3rQstkMAtNNGlwtFQtYofGT0=;
        fh=ISzua7oZ1Z7ciAS7pAW1IR33y94qhMyxInJanF7aW0o=;
        b=S5rhn6QYWIlmf8FQpjGTbTSzXrkVfKYDXe8KQvOe9s/u04a5Y5eIQvZvwjKdLaA5Bw
         jlogxhvS8Ahl39wjpV+n0qQLcXttBUMVDtwaInvT3lD2Sb7avkYMg60HODwmoErQisNb
         gNRO3l334vBkgDYAJUi4yfhQEfhWGTLqJAR1EbeDOaHoO7RY19qMuXjAQs98XGYCOR9r
         dOFlxTkEi2lsGaAMnN28sGF+DQ55xVRsnknhxtgsfo1sbFOTtusymrYrDWFIAaSHDXqB
         Flnq83f5ZoNunNdyT/A2KcIdQd3sigRUVUIVhIfYavOn0B/nSnKDQxG62tFOy+9lSYr8
         5WBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787156747; x=1787761547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5RCTORorN4Bf1q2o7H3rQstkMAtNNGlwtFQtYofGT0=;
        b=IzCm3Q9IPhbjf4P5i5Vr2s0EnW98xBjtdQLwrTdMUFzkOfYhWZNHIIJB/tge6I6nUl
         ku3alYhF5Uhfved2w5uFSZFTEwVvsPI//gA+iDw8oss5PiW/4OzfIpVg0d9b6+og5otz
         mmDiK0MEvEZntZFlpCGBLupmhzeEqHYN2y9kqASFRaB7cjzr0OxNPqia4d6M5D3dmt9S
         Q9gdcIJog6bnphrt9fjsLFF0njWeCuLImRaTZ+JBaKWwON+CI6oNg0c0LFieHBsm9W1U
         3Ed5DlZBsm19peXcK+vMwJ9zSBuz+eG8G6NBXWcgh/GZzrjkOmub/6qrfsEHdFYH3IO+
         XqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787156747; x=1787761547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5RCTORorN4Bf1q2o7H3rQstkMAtNNGlwtFQtYofGT0=;
        b=lxwzjOYdsL4DztcbGaCOUYaKrIpG09/t0omOGHPSfkA9rJjYgG98dR6Cuuoc2rARUc
         qYNe4TpuDKA8hI2kIzTuuyIl5MQ9xYwsaVEnBhwZC6OBwSbNSauvb6oPjlZHc8qXvlEn
         xX/KSdQP18vKqB2SrkU2mhiXwqI3KvTs58KTnb6iMQ6gj26jK9NRb4gS+Gh06XzcaKnC
         dmv7Cyny+jJH8AECdTbzEZKbmMVjS8u9GJ/Vpn8GuaqaxYgNar3u/IWh9FKD1+wjjpYa
         4pPoLl01y2YOQzULm13wuh5auROZ3enlDhpbmm+LRadoH3RL/xM0PNZIHzgtVWjrc2VQ
         tBDg==
X-Forwarded-Encrypted: i=1; AHgh+Rqa0jtcfo4uXzMUpKoBBuUG+R5lJxAbVGSdFQgcVX83vx43oarI/kMSNmsVLdaFUnoCk6XwJa9gTD1Q5xZn@vger.kernel.org
X-Gm-Message-State: AFuF++n77Awir/0jLjOy3XMzM28iqvWIv6CPHeel0NPOR8CEO6859mu5
	s8wpERshKOxbGp8DPV2aUTJn4swhaO1upxlaNXD6j3W5UCRAbSqYBWZo6CfRyTQsTKafsoNINNb
	L/IJuXUoqsu0cNWFBwU0cWSC0E6CKoOU=
X-Gm-Gg: AR+sD11QQ4wJi8tJpMZdRz5kbxH1yhmInE/lQmoQRmYf6YoYw2Dz6VO0d0j9k+s4R89
	1pntjBv/2lGfejo4ivdFPFDbCd0NhVQEXqZlAR39y+HllC/iPZ2P4vBumdw2Zg6LAGkAaJe2hhX
	w53hjQ+gmQTAbvDhJijjkE3f8Zfx1wuP8nLngYxAuxrjn3Vm6/7aEmBhdDD5Vz/Qa5tFqqep8zV
	alaIutlRSVWrVKCP2D0WKCRUgFTDYFmeTlpK18slNy2XrF+OBE8jdYWpR+lJLlXXdlPWlM4BYUE
	P+c73lADAQ6OVghrna6hIShK9wlBvkgRxf24Kx7YBHTE2Cy33k6qy/Gh5meXPBowykwIg5Gm/Nd
	jexMFT8kN5p0As5H/UfpeA/oDddymUwJ3JjgCx+g=
X-Received: by 2002:a05:690c:1b:b0:81e:6c2e:f0f5 with SMTP id
 00721157ae682-844e2324f52mr29600307b3.28.1787156747164; Wed, 19 Aug 2026
 09:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819125425.192316-1-johannes.goede@oss.qualcomm.com> <340c1443-9e2b-4224-9029-f1defc644494@oss.qualcomm.com>
In-Reply-To: <340c1443-9e2b-4224-9029-f1defc644494@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 19 Aug 2026 12:25:35 -0400
X-Gm-Features: AcwNN1UAZPpOUZd10LjgTjceqxpa1OAV7zOqXLke9NZvRrCNfgsWSzvPlCS6wUc
Message-ID: <CABBYNZ+cFGH0kD5iLw1WnUWuhSxkgwu0BZ1E0WYCzOg9D92quw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: Do not write to the serial port after
 it is closed
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, Aug 19, 2026 at 8:59=E2=80=AFAM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Hi All,
>
> On 19-Aug-26 14:54, Hans de Goede wrote:
> > From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
> >
> > hci_uart_close() closes the serdev port if HCI_QUIRK_NON_PERSISTENT_SET=
UP
> > is set (for example, for the WCN399x family). A failed hci_dev_open_syn=
c()
> > following a successful qca_setup() calls hdev->close() but not
> > hdev->shutdown(), so the port is closed while power->vregs_on is left t=
rue.
> > qca_serdev_remove() then passes its power->vregs_on test and calls
> > qca_power_off(), which writes to the closed port unconditionally.
> >
> > Seen on a WCN3988 by unbinding the driver after a controller failure. T=
he
> > trace below is from a 7.0.0 based kernel, where qca_power_off() was sti=
ll
> > named qca_power_shutdown():
> >
> >   Unable to handle kernel NULL pointer dereference at virtual address
> >   0000000000000038
> >   Call trace:
> >    tty_set_termios+0x50/0x238 (P)
> >    ttyport_set_baudrate+0x84/0xc0
> >    serdev_device_set_baudrate+0x24/0x40
> >    qca_power_shutdown+0x158/0x1fc [hci_uart]
> >    qca_serdev_remove+0x54/0x68 [hci_uart]
> >    serdev_drv_remove+0x1c/0x2c
> >    device_remove+0x4c/0x80
> >    device_release_driver_internal+0x1cc/0x224
> >    device_driver_detach+0x18/0x24
> >    unbind_store+0xb4/0xc0
> >
> > Check HCI_UART_PROTO_READY, which hci_uart_close() clears in the same p=
lace
> > it closes the port, before writing to it. The regulator disable is left
> > unconditional so the controller is still powered down.
> >
> > The dangling serport->tty that turns this into a use-after-free is
> > addressed in a separate patch.
>
> That separate patch can be found here:
>
> https://lore.kernel.org/linux-bluetooth/20260819125748.194377-1-johannes.=
goede@oss.qualcomm.com/

Hmm, I wonder if both should go via bluetooth tree?

> Regards,
>
> Hans
>
>
>


--=20
Luiz Augusto von Dentz

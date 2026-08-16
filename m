Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CDB3403FF
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786870768; cv=pass; b=uBilxDpG1GbI3LK5ffY6wL5hks7iUXAPq+a2Ee/rmp3ZH2wOS2sWWfJaJ+jkZxctgEcUAPOJ/Yh3NkFk1WNnG8N9FEZbbqzMZfVplB0VB9Yefl6SxmPVIjtq1YN7vs4oN2MOTTf+b2+MpO4gNJm9LVRoXQ92YmT345rOvSUwoZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786870768; c=relaxed/simple;
	bh=MrRkNVXSVcfDkm0x1IqVS/OiN0O0+RNhnY8dYOfvfZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QF2L2ATX24/9UPEMf5D8QtYklOJfC1+PY4vAt8UTOYeHTkEe+VdNw7bHm4UmXGGSZVAE/NGH6inOxNWiEFgfYfNtr2E0/aP0axf1SiYU/OT8vrgi9Rzt0VhIrkkp+9UQFtnvJguSJi4+xsqP5KZTJu8O2SMbF29SEjtinDIq5mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ik8cqEDm; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ik8cqEDm"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-74ae4c75b20so1270506137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 01:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786870766; cv=none;
        d=google.com; s=arc-20260327;
        b=rz47DLupv/387yimyT2bVnZGK6+qpU8ZIAfVtlDDA+2hMuUVXo50lk05zY0vwzgVu4
         BQnCe2pqHc/FQtiyvFCV9FT3TDla6DRgId1yR46VGqMuOp/9PNGoTjt6pck32BOoso5B
         Gk+E+ealbQ0tF4hlhvy++8Jlf1U2M8XD0oGMtb/Gsdca80SIcOc55h3uefFF/2kjwSXi
         QM3rj/ycO1HOnyMYd8rRyIKeYWRKNhknMTsMZDub3xiYhE6VJejirdKOO0ql87BLPHf3
         L7SejfiXDpeiJLkIlqClB1EHa+8u0Mb6WildVyw/pR19gNdud250TI5H+p/1QB5loZfB
         ywcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1LmQ4nt2XjP2OgxPqtP/sT+nzVt0sYBaB8O2AA9vv9A=;
        fh=Zf22DZjgfwAmSfVWT4OsD/2DdjaOw5nYo/FE0l853MM=;
        b=BCkbG+zLossPF8TrKD4L6Rvt4okYKemysMAsL5ElcXoSUIq3HnOHFGf9wHDSHRsoNK
         wEQuBBXFuPjSWjricYT3nuvrAINWiXi9jbEO+/zqHq1GRaxe4a06XDUZ8onyk9Pw4UNQ
         vCZA62a2ilywA5DGrIWT6tZegF8Hsmkfk5qZFCEE0SoJINWXifOXv9h8md8vE0yWfayF
         xkarfHXYntP5n3ZYAi8xfqokGkRHe7j8Zt1MxTdAX1nrjt0Cr9j0oG77LRH53QMEwDX+
         +Xi4kUSFMu0fE2eU+MQPPuKzDbir3R3U0mdc8wpz6NpeosFXpyyxNxS3qlM0LR4rAhhO
         /IuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786870766; x=1787475566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LmQ4nt2XjP2OgxPqtP/sT+nzVt0sYBaB8O2AA9vv9A=;
        b=Ik8cqEDmdgUqfjohdx0q/g7YAf3AtzikgalaiZ4HZS/EenYixYrNUxzMe2Q6mqxgg7
         2+vugnwKOvEXjpOLv0l4Pwl7pP2aignd/Xl+xO6XnHEt6Ozi11tqyq2TiKNYCE5pI2hK
         CNqcptFe6hsCoDf9E0FiO3YXoL3iDN3smR6ngeTHiudR6TpGXkMaB5ZX2CwIHbFnn+Oj
         mfgLv/kOpN0VlX1A1Vbcm/P8wjpw8TOqP4P8C1CPkyAGUcCuNVx2+SWQkQpYLggUU7DF
         LkC/Elzv7NC0p01rVwIpTcnHRgTF78t8PYYVO2hNBnu8JuD6aMGucmx13UBq+2wY4B61
         1I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786870766; x=1787475566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LmQ4nt2XjP2OgxPqtP/sT+nzVt0sYBaB8O2AA9vv9A=;
        b=tNd7dZoa0Dfk0Sjyixx/+q8jrVj1ibS1n9KXDfbhOeXHTiSgdlJ/Hlkun9UQxSOWjQ
         XKjKc9/6PXzBXHx8gEomOKywuXrKq0dsTcLflKcMTxz+qyD1xFv3mc+jvHKf7Y6EQ+rd
         Dn8yUxcE09KgwmSKNYO/7fCd5b9VyhICQphE5Two+RhDASx5xXQdNzA2wdGB6dJD+o8c
         pOCkA7ItPEerBC1/+OqCvwnd1jnCDuSkVLDSVpAN+QAi+iaol/E1d6y7sOeh1xz7WQUo
         rCManmIV30haiA5SC6/kqXObNe9V8f4V2i2pN934T6cNkfSdFmWFWqNFLcrySQgucjUw
         trFg==
X-Forwarded-Encrypted: i=1; AHgh+RoKIgvWfVQH6R5Qo5Qw9fBYmHtMO/CMLGeLYaoxlDLndHJQ/wnwcHSGRtnZeZEiY2heGSjSqsv26F4XqSl4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxij3LjRVl34cQLwic1cFA3YMm78/ZxEmuxVsU77YEFYA6MbM8f
	nnFG8Do0LfG+955w3UFrRqJMntHiaQoj4wc87+AprecKiK45ypBYXgTMuDpUEngwwI18cMLQGUR
	6R5Qr4RDd5rxb7/JhO9XLJWjRqNw2mgHLIfzGoJ4=
X-Gm-Gg: AR+sD10O/JAVBi3KmnwzrZVLvkRftoVtZSXdsx4hew011Hxynmaw9ZpT+LSEaJlmFTk
	u/lZeRRaur4r0n6wLpYhGaWNxHK7GG3PHO4bQfni574161I489N/Jt6era5tQrV/Yp3KnDhTHRK
	o8ZhHinjTssXXJI9VYpy6tMMhqy9QVZwzR2KS38wPqrnZbBnEq1PiHMMy9mfWw4DttRIgdn4HrZ
	CleY1t51aSjRyjOK+ZuDhiOTEvdTxBjOE3WwnRFpEgxeJ40i6k/HC5/2Lw8H7BES0bj3MQTkq88
	mk44A23uUsxc+oAzkDIVAbN2KqVhCuK58013UaJ3lkLB0HG9CrHzvE4A/5NnLLBd+PHsR92TX9M
	=
X-Received: by 2002:a05:6102:3943:b0:760:330:312f with SMTP id
 ada2fe7eead31-76dd3bc43d6mr2139074137.15.1786870765925; Sun, 16 Aug 2026
 01:59:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com> <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com> <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
 <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com> <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
 <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
In-Reply-To: <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 16 Aug 2026 16:57:36 +0800
X-Gm-Features: AcwNN1X3_AoqGZg6lT9YwRS-zp_xWQ_uWAXtkWj--hAmpkIidjFcYHLYoqMRULM
Message-ID: <CAH2e8h60opbaRGjZ_GhY=vboHEBpYUAEcO4SQ0-oTxoRXG3j8w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 7:45=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 12:41 PM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 6:34=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/30/26 12:30 PM, Pengyu Luo wrote:
> >>> On Tue, Jun 30, 2026 at 6:29=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 6/30/26 11:28 AM, Pengyu Luo wrote:
> >>>>> On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
> >>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> >>>>>>> DSI panel driver have been added for a while, so add the DT node =
to
> >>>>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the D=
SDT
> >>>>>>> describes the wrong, no impact after manual disabling these wrong
> >>>>>>> supplies.
> >>>>>>>
> >>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>>>>> ---
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>> +&mdss0_dsi0 {
> >>>>>>> +     /* real vdda is unknown */
> >>>>>>> +
> >>>>>>
> >>>>>> L3B: DSI core 1.2 V (both?)
> >>>>>> L6B: DSI0/1 PLL and core 0.9 V
> >>>>>>
> >>>>>
> >>>>> Yes, that is what I saw in the DSDT, however, I can disable them
> >>>>> safely (hack the regulator driver to add a sysfs to handle these
> >>>>> regulators), the panel works well.
> >>>>
> >>>> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
> >>>> ends up being on), UFSPHY and USB1_PHY
> >>>>
> >>>> L6B additionally powers the same components, minus refgen and USB
> >>>>
> >>>
> >>> No, I confirmed they are totally disabled, since there is a way to ch=
eck it now.
> >>> https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c1=
52e6c958@oss.qualcomm.com/
> >>
> >> This presents you with the status of the votes casted by HLOS, not
> >> the actual hardware state
> >>
> >
> > If so, non-HLOS will vote on some critical regulators to keep them on,
> > IIRC, once I disabled L9D, system reseted immediately.
>
> NHLOS will generally ensure that the hardware that it needs is
> powered. This does not extend to hardware that *you* may want to
> access in Linux (or which was left online by UEFI), which I suspect
> was the case here
>
> >> To get the latter, you'd have to dump the SPMI registers
> >>
> > I will appreciate it if you provide more information.
>
> Take a look at drivers/regulator/qcom_spmi-regulator.c, you can get
> the actual live value of the enable register and the voltage selector
> for each regulator
>

Hi, Konrad. The real case seems to be as you said. After disabling l3b
and l6b via rpmh,

# cat /sys/kernel/debug/regmap/0-01/registers | grep -E 'c[1-9a]46:'
c146: 80
c246: 00
c346: 80 # l3b en
c446: 80
c546: 00
c646: 80 # l6b en
c746: 00
c846: 80
c946: 00
ca46: 80

Could you please have a check if this node is available for
sc8280xp?(I want to write 0 to 0xc346 and 0x0646 to ensure the ldo
disabling will  turn off the display.) This is copied from sm8350, if
the fuse register is 0x7820a8 for sc8280xp as well, then it is fused
as disabled.

        spmi_debug_bus: qcom,spmi-debug@6b12000 {
                compatible =3D "qcom,spmi-pmic-arb-debug";
                reg =3D <0 0x06b12000 0 0x60>, <0 0x7820a8 0 0x4>;
                reg-names =3D "core", "fuse";
                clocks =3D <&aoss_qmp>;
                clock-names =3D "core_clk";
                qcom,fuse-disable-bit =3D <24>;
                #address-cells =3D <2>;
                #size-cells =3D <0>;
                status =3D "okay";
        }

Best wishes,
Pengyu


> Konrad

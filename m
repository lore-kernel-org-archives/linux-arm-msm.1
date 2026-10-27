Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083235;
	b=fthcFq0udkoAAsXbvPGjkJnIincznsxDinurK59uxFNJIekOuKqSwyvgBTXyo3MEcaoV
	 LrOfYpXVxBsF0lmac7rWHLgCYtw9YrztmpHqqIJyQ3n6mZ89T8Q2EXakE+O3uEoIT7XMI
	 3/vXc1nq1Ci8gDE0Y/sfZe/PdvRofK09+8QF5h4u/fs9pnYP6mvrO4KSsGOVw7HxJ1EAN
	 UVVSRUc0NyDgRSnggac/C3FIPGvlkFG5Tk4WnB+9A97uu/8TkiDU+Iie7bV4/CS4tpfaI
	 48pPQFaHhryTwPaHmf5QqAAytc4TjM00eQ5JsFtWOjdlJei1p/Qocneq6moHDcpPmDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=FMlVixG0r7ucjTAqdIszWewlNzO+T0JDcfYGipLMztI=;
	b=4w5Z1x9Pc1TmPIsMCxa3vx6boo+KwnsmUUOO5GyULwriN5SDPpN/pI+Qq5fDUuUtTbs6
	 2LQv1Q0TAmVtToUwnNcQWlKjrWmHLUzoDrkVYEiiKqCkH2CBBmCEPX5umFqLJhuxTqF4q
	 KEKmOyWcgYO53WtQhc++Yy5uD0vuD9E1NzGHBXU/Xvi4ZlKj6KOsW+4NmMcBQ1yZH4xff
	 D5n4N/aWwbp0jiWf/vD4GHsnaFrotbcAUV/r1yj2y2oyz1vYu3cDaiOCTp+q5n0Ym+LKL
	 YpfDACQpXuEzQnbe8VOYjFi3hXnf97ry14nmkBfZ03PNe0/jym190TzWNXVO3bvV8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C0CPxuo+;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C65606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C65606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C0CPxuo+
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so3792151a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 23:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793083234; x=1793688034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FMlVixG0r7ucjTAqdIszWewlNzO+T0JDcfYGipLMztI=;
        b=C0CPxuo+KdEaQyPnZS8KuAy5PX0fa824kYaMK1GEXSXUZ8Ghxds/6AB2PkalA0VYyb
         6RXmDkaAJYWF4HKVte5cztqYvAunN2CKzdlT9RVlcW2hdL8Iz8eRlf7pVhsInrbj/vc3
         9LMaDH4SAriDU3zRZGke+KlOpACdRYw1U7OqCgVasV3gk7I3A6qwYm8qCWwLPGKx1BJ4
         Q0FlOlPjALOP+BNuCKaQbSjA3inP0CZdhroo31/ppvcGKgtrBm8yzzHoQcpm9mC+89ri
         F5U2mXVu4gGwbu8LirOBolvHYwzb+fs633zaxn6ax2M22xuir77VVHJEv2oHFDcSKv8y
         yXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793083234; x=1793688034;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMlVixG0r7ucjTAqdIszWewlNzO+T0JDcfYGipLMztI=;
        b=JVpZoAOOuCqA4FSVRj/3laMCGXSmXHCtwHL9LdzzAvDGmnMPN4CRqGjHW7WJi2fDX/
         XX4RICut1v0N9yNYB+28CeeriVJW5PBK5Oue4qPA6z1oT+5hdqlVcamEw7H4MDavtO/1
         OFnxpN6gz2PC3I/FWIS8kUCw+lc91y4oUto0tiKlSt471+SYxGGjwKPvyhQ0po/OtyKS
         zBbajw3+kCK4GltOp5wgMX1MptwZlg6LjFNcv/1gfNFOz72aSKkOB/83AgZNtQ1YmJzF
         aoJlZdi/YjesAkgI34BZu0tr6hBndCGUll9d+RH3b3F1cToyVWYWaVhr8fUngBvuLCOB
         YDlw==
X-Forwarded-Encrypted: i=1; AKwUvByQCaqq8k5JXdmCfi6CQN4sS6yvv6ONeJDQDrz2nXVTvg62ZHs3bVLBZ9+0TglEg86ptKHZHhu9u5Yub0Eu@vger.kernel.org
X-Gm-Message-State: AFq9FYIZRPFstSlETNrjZ24Vb9svrCedpXnCwsI0N0ptAIaynPI+scRv
	BySFQO2aCFbSSDyPVr/lxXRab+wCnHBMHvjhxqlU6w7to8HAkKxH2rw=
X-Gm-Gg: AYBFou1yHo3Qe/51DLI4FDJc4J0obkB3KAXDx87ENMMfvWdfURTWXr3p1Oa7yc0BosD
	rLRI1QGEZQS5h2i24FV8jVfeGQLM8hPZNDvPQwj0BAwQFfvXMFt0swvi04k7rRnRM8vZeb+ur78
	COu7yIr0xPzA4UugpXrp0n3PvXOumh2sd3++LxZPc3aOaWzk/IPCnmOteJfYdyQwKpObxdYJVJt
	0MeBnIiUS5Ou8mbCCluVtjrKCLXFbTTFBvlnudjgQOe0n6554Kgh2Ue24X9VgPVNGzVD6T0BTqW
	+bmRfXfolKgGXrxENAtIRAHT6mECOreVW23dOT1NKiZfD0Er7rOjXE66DMrRl8CG0p9Br8hsh1p
	wB5tpIEn4XhGQRaY2/2CSE8JawH9V9UrajdWUT9ZDohRNnMtMUWBJ9I1u9uFFKSr9wMM+yK0a/l
	SwJswWdHsW5NoPeA5uVn3iNzeghxmR9IsZB6Zl9HYti4QSCMq73NGQUvjIxd4cSn9qVcHB+LVIS
	K98LWb5vKNodYwpmuVRVkyAYoaJNft29ZylMowuL6rZCIrgR7o9wLVDBdJ3h06fI9xYiu0ZPJsG
	o/6iFIfvIb/RKw==
X-Received: by 2002:a17:90b:164e:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3ade9b2ed66mr7926692a91.8.1793083233783;
        Mon, 26 Oct 2026 23:40:33 -0700 (PDT)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066cf2dsm2200569a91.16.2026.10.26.23.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:40:33 -0700 (PDT)
Message-ID: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
Date: Mon, 26 Oct 2026 23:40:32 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
 Nabige Aala <nabige.aala@oss.qualcomm.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
From: Burke Cates <burke.cates@gmail.com>
Subject: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Could someone at Qualcomm check the Glymur USB43DP USB tables
(glymur_usb43dp_*, introduced by 5b289913959b "phy: qualcomm:
qmp-combo: Update QMP PHY with Glymur settings") against the
supported production settings for chip revision 2.0 and later, and
post updated tables if needed? Is revision-specific or per-port
tuning expected?

In short: on a retail ASUS Zenbook A16, USB Gen2 fails to enumerate
on one of its two Type-C ports with the mainline tables, while
Windows runs Gen2 on that port, and local changes to the Gen2
receiver/lane and common PLL settings make it enumerate. I'd be happy
to test proposed settings on both ports and report enumeration, DP
and suspend/resume results. Details follow.

The machine is a retail ASUS Zenbook A16 (UX3607OA, Snapdragon X2
Elite Extreme, SoC ID 662, revision 2.0, BIOS UX3607OA.312):

  C1 (left, rear/display-adjacent): Gen1 and Gen2 enumerate
  C2 (left, front/user-adjacent):   Gen1 works; Gen2 fails

The tested Gen2 device is a Realtek RTL8159 10G NIC. Two different
C-C cables reproduce the C2 problem. The same adapter enumerates at
Gen2 on C1 and on the Type-A port. Linux applies the same USB tables
to both Type-C combo PHYs.

On C2 the adapter either enumerates at Gen2 and resets/disconnects,
or never enumerates, looping on -71 ("Device not responding to setup
address"). For context, this October 22 excerpt is from the earlier
flapping case, before UCSI was started in the initrd:

  [  307.056050] r8152-cfgselector 6-1: reset SuperSpeed Plus Gen 2x1 USB device number 3 using xhci-hcd
  [  307.136539] r8152-cfgselector 6-1: can't restore configuration #1 (error=-71)
  [  307.136705] r8152 6-1:1.0 enu1: Get ether addr fail
  [  307.651093] r8152-cfgselector 6-1: USB disconnect, device number 3

The failure also reproduced with UCSI running in the initrd. In an
October 24 A/B, keeping the cable and orientation the same, the
unchanged USB tables failed to enumerate on C2 with the -71 setup
address loop. Local changes in the Gen2 receiver/lane and common PLL
settings made it enumerate at 10000M, with no -71 in that capture.
Windows programs different values on this hardware. The A/B suggests
a settings issue but does not establish which programming is correct
for production hardware.

With those local changes, C2 enumerated at Gen2 with both cables,
in both orientations and after s2idle. C1 still enumerated at Gen2;
DP still trained four lanes at HBR on both Type-C ports. I haven't
isolated which part of the settings change is necessary.

This is an enumeration result, not a throughput or complete NIC fix.
On the changed kernel the RTL8159 still fails to get Ethernet carrier
on both C1 and C2, and cfgselector resets recur. That is being tracked
separately; I have no Linux iperf result with the PHY changes.

Under Windows the same NIC negotiates Gen2 on C2 (USBView: "Device
Bus Speed: SuperSpeedPlus") and carries about 5 Gbit/s each way in
iperf3 (about 6.5 Gbit/s in total bidirectionally), so the port and
cable are fine at Gen2 there.

These tests used v7.3-rc5 with out-of-tree Glymur platform/board
patches, including DP PHY support. They were not on an unmodified
mainline kernel.

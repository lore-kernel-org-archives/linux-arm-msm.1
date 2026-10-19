Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D184F30F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417599; cv=none; b=JpFJ02UFq4YTzLr9frrHjB7srXeKEda+yabJdHljUElGKrgHLItuTIZBxyNDVJWvxmGUdrAKqEQWTHZeOICHxpfEE89r6VEBJowUHoUqSFiMFExGnXDC7Pm33mccj87n3s/p/cnoK3wNXUhMNrdpHeHXdI/VCK/nQtvySBJ5IFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417599; c=relaxed/simple;
	bh=E5U0AD/EJZOCCwN8/VqoUxWGGZvlKKM5by9g03EkX2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5AP3DFGU+2FnmXhl0S4Uz+VYiUGBf0UCT3Tc/G4vcl/J5oyxiTOZ/WV7SSbyev+JyaRPLjeUmoVxD9QysdouuefRdajXIRamsmtUGzelkFYXdvoLGTkvBopGzVgLADaegBTyfr/liAQZeCcO3SoVNUQNYWDKhc61Ufk7ZuEXC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQy4Su5R; arc=none smtp.client-ip=74.125.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQy4Su5R"
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso2225725eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792417597; x=1793022397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcK8fTu+iCNwFArbFhodnL9AHFAK8ZMg+EiBVqb6o90=;
        b=sQy4Su5RbC0d3y+U6boZv7U+ZpYkr0ztVq+BLlE9A0Y6MVhI0nE+CmvQMzFL46DDvc
         2on3opdaKpaaj+lcml8Ge60xArgD++T1kxlglAllv0jOElBdHWmLzqpnh8B//a6DIkyR
         9cZfO/cVXPaxk6gQJfraT4gZBdRnUXgVthT03DOju3XE4CMr6A5MwgQYmlDhk3NKyr1y
         KXuZgpXIMnxlyfOCzNOWuQOIvph4bLZcfYsjXqj9FUMdW1kVzKtMTQMTkBTzMt7sy/9b
         7J1DEQqS5I2JmsWLxcdXIkfgXraFWxggfZ9PfKWFeDv5zBJ+cSlbYN9Esu0fGgRmXv8A
         Kx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417597; x=1793022397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcK8fTu+iCNwFArbFhodnL9AHFAK8ZMg+EiBVqb6o90=;
        b=iUHJJP/WLtAMiRvp9h9LA7fHE/bV8R+f0a9pZqaEMyZ5oJAJGu09uQM6XITx8Q8kpg
         5F6Gi4TAmiWT/djs+e0DMaOs7yIlX6u+BvGPknUWzIQ3x4RV+6c1qs9vfCrWwx08sZ1k
         zxMsAbZAb30/5vR07AqetXlPq2EdHsgvHiTOUa3Zt5TKF+Zc5/6wjnY1y9meDSdM6c2G
         fPx3MQdvUB/3GhwLhL2HQl4VaOybwkQhzhNp+aKhTkkyMTP3vySRQA9vS/NT1JPj5gBs
         FXGm3SDSxtNCVAR+t3lnP2Vxh8QsF9G66b1l6Ny2bMJbkqhUcMEfDotvsQ7B8yIb3GLe
         L0TA==
X-Forwarded-Encrypted: i=1; AKwUvBz02S6/671EbSsJS4S1o/PmKF+bN3NZob+bKKAkjYcFz63ZwkFif0Ns1XM5Bb0QG/y8kGTez3J2p7TcgG0K@vger.kernel.org
X-Gm-Message-State: AFq9FYLbDbPaZ4Fdq9d4Zw/dXfnfqk5jXMfhOnLwyrmLqSyPRE6I7TXW
	t3uj9Fe46oW4Wn01d46GzkQd0ZDU2Itpsgnu95Mn3+N3kVrCTJxw/q4=
X-Gm-Gg: AYBFou1jlJMg/nVkfEaNbka04xPl/Np0Nj9ph7to8/Lyo56AQ5kmqGSvdZZExZ0RGrK
	M1eQxsX6yysNacVq38aqXtWYgGMhWnQYozxJB54ovNhnpsTz8HkrBS5B4RT5ZD3c/xpj/S+kGc3
	AneoV0QD/LziliTqrR/l2vmC0FQVAFLRlSF4J13AwVvnNCg9IgeifVu+9XpYqzs2/DzpUbGkohX
	XX/tULdL735Je2JcZfAPCJG5H4qV+V8O544YWyQE6r121W0ZqcQuj40ludOK4WaepPPIhn5jtjL
	7xnch/NAGAH8pVRYckeRnWpwodShdMnZL5LYOk5xwvEq9F1UyQXZJ2cqT/xBwwxzlC6aNTG9Mj/
	2G8cpqTKTatqU0msVpchU1YUqfDdLUSmsIls7eZVV/3847o1suE/u3F5nhPGA78S9ao/0JKkqoa
	T2/GA2psYZVWhMbGyzeQzPeuDneUo42F85bDDlnHNm4gUQCo7UnJdbmKQ1Zp+HxQ+8k66QPTeU4
	thi
X-Received: by 2002:a05:693c:834d:b0:35c:de00:93d3 with SMTP id 5a478bee46e88-361a2c3503amr10589246eec.40.1792417596679;
        Mon, 19 Oct 2026 06:46:36 -0700 (PDT)
Received: from localhost ([2a09:bac5:3b20:16aa::242:77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm32661349eec.13.2026.10.19.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:46:36 -0700 (PDT)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: mani@kernel.org
Cc: netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: net/qrtr: would selftests for AF_QIPCRTR be useful?
Date: Mon, 19 Oct 2026 19:14:48 +0530
Message-ID: <20261019134605.40645-1-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mani,

I am fairly new to kernel development and have been reading net/qrtr to
learn my way around it. I noticed that there are no selftests for the
QRTR socket family anywhere under tools/testing/selftests, while
Documentation/process/maintainer-netdev.rst asks that series come with
tests under tools/testing/selftests/net.

Since AF_QIPCRTR and CONFIG_QRTR_TUN both work on a plain x86_64 machine
with no Qualcomm hardware, I tried writing some, to see whether the idea
holds up. I have a tools/testing/selftests/net/qrtr/ directory with two
programs, modelled on tools/testing/selftests/net/af_unix/:

  qrtr_sock      12 tests for the socket contract -- the ephemeral port
                 range and the CAP_NET_ADMIN boundary described above
                 qrtr_port_assign(), the bind() rule that an address must
                 name the socket's own node, rebinding, EADDRINUSE,
                 auto-bind on send, and local datagram delivery including
                 the source address seen by the receiver.

  qrtr_endpoint  12 tests for frame validation in qrtr_endpoint_post(),
                 by writing crafted frames to /dev/qrtr-tun: length
                 alignment, unknown versions, headers truncated below the
                 v1 and v2 minimums, bad declared sizes, control payloads
                 too small for a struct qrtr_ctrl_pkt, control types sent
                 to an ordinary port, and the legacy control port number.
                 Each frame is malformed in exactly one way, so a failure
                 names the check that regressed.

It is about 590 lines. All 24 tests pass on current net-next, and both
programs skip cleanly when CONFIG_QRTR or /dev/qrtr-tun is unavailable,
so they are harmless on non-Qualcomm configurations.

Writing them corrected two things I had assumed wrongly, which is partly
why I think they may be worth having: that bind() accepts sq_node == 0 as
"any node" (it does not, it requires the socket's own node), and that
rebinding an already bound socket fails (it does not, the socket moves
and releases the old port).

My question before I take this any further: is a test-only series wanted
for net/qrtr at all? The netdev documentation describes selftests as
travelling with a code change, and I could not tell whether a standalone
one is welcome or just churn. If you would rather tests arrived only
alongside functional patches, I am happy to drop this.

If you do think it is useful, would you be willing to look at it? I can
post it as an RFC whenever that suits -- I have not sent a patch now
because net-next is closed.

I should be clear about the limits: it is built and run on x86_64 only,
with no Qualcomm hardware, so nothing beyond the tun endpoint and the
local node is covered, and I have not tried to test the SMD or MHI
transports.

I should also say that I wrote these with the help of an LLM coding
assistant, and a posted patch would carry an Assisted-by tag as
Documentation/process/coding-assistants.rst describes. I have read and
run every test myself and can explain what each one checks and why; I am
not looking to send anything I do not understand.

Thanks for your time,
Murali Krishna

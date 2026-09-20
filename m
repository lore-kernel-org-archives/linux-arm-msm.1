Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6F2F7EE4
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 04:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789877627; cv=none; b=ue7Ed7vsepW2WoE4CW6olt7FvpjtZgnCtjnd1SbL5llF5jlcIOQkKagnMIbTf+SmUSANP3tQjVbaobv6xyYzT524ddmZmbioW1XuKNUmoLDZkJXCtFYEpdoTlYgZO4+cplq9STCI9yEsEEG3S8AdTLcFsrV94wYlCNkqvX+keCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789877627; c=relaxed/simple;
	bh=0OVzIh+vsvtVC8UGyCseiAR3iEUCTny2s5Sp70SRs7E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GYlB1wSxy+gIvQAnY8F+bMlULXmP0Vt7rSCkMwUxyzJHB9LZm+Q//wteDC4XpWPXHug3UDlfnZarQ3q2yHOyNUNDQjDivXZO6lwBsCF+0v+bdis2RD4INlFJ3tIYUQHuyY/l/e0YpwAC9wb8lZrgXG0jLDKYa5N963JVOxArgCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f5.google.com with SMTP id 00721157ae682-864fddff168so5423287b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 21:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789877625; x=1790482425;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0OVzIh+vsvtVC8UGyCseiAR3iEUCTny2s5Sp70SRs7E=;
        b=oZNb0jKLq67HhPzAhTIVuAE+fpylZY9+zOD2n32iPmcuz/EXnxeeDFDAjycXASVzJA
         eMdPgisAZM6H+eLpMvHZxue0KZ4AeANqlEzzC6WMARlFvknDt2QzCq0R+JozLhHTYfIj
         6DOTwMjn9uqcZPygp8bHg8s6de1tSIX3RsR1hpXPsyoc06PCxxyoZ6ey2uvDHpS5Qvwf
         me1PDmUh2UDhULEzwzG/E9rT7M3099Teh5ZM6SnSUT3VQv1AiaG9y4U0RX8PcdH0EndW
         DXB8N2BMcE2dZgEHKCXu/f874vGhAtcob2XsH0wLuGgHmEx44YjOnFPRwO2iOiZ8ExMz
         l4Sw==
X-Gm-Message-State: AFuF++km5+vQ5vtGZBx45QL6oSxs53fI7jwYKDKx25Y3jMXtXt4lnUka
	bpxwzmsLHsG+1arNPvN66xpc8NTE6kXBHp2q2/SVt3VtOKyEVF8AvyJj02RsMyBRUrcjTQ==
X-Gm-Gg: AYBFou2cJxQBXgIw/LSJp/HKYWCjTzXv1HcEwV6Pm5vMBlfEuOIBAvZ0Lm1dVlWHi8q
	NkhucTV+PpshCDma4JBPCBqlCpDWWKRP2w3qwyej2aD7wAxP+CKsc64mNkUfKurkVvJw17Wwgap
	jMm8TDRpl/W2HIvxf7vBcrafO4HjylZyBhYdpU3AsrHvXBonB0DwSrEamqKJl1vMVYTdhl84e2U
	zZKJi5jV3WlxPcElu+b7kFgtNPN3AOq4qeMddr0GUKiieUZX1jAu/hZxLDONSyugsLm8w16tWi+
	5TuNmkGlBm2lXrCTr1OD6LFJL6gwBUvS4BK2BZJvGsCPa9sZkl8f3RAAHE1Z+0/eSilTKp43Jcc
	t3JcDEwGm0fComMhfi6bdsrVbxE+EuUf7D/qvWPwCRxw4+vMK6ZGkhdjJzfkl2g3WoX/uLJ0tFJ
	ZrIqNFV58JWfde1DJZvyNwF+MNwU2BDD8jmutuRPtF5CbHVL/MJwdDEU1iNKSV5/pt6TPm9kyS3
	BVf8WOlSWpU9iCS3Kkd+ukMLw==
X-Received: by 2002:a05:690c:e147:20b0:892:4ca0:91b2 with SMTP id 00721157ae682-8973878af46mr15066797b3.68.1789877624707;
        Sat, 19 Sep 2026 21:13:44 -0700 (PDT)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com. [74.125.224.141])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a46e4f919sm14216597b3.24.2026.09.19.21.13.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 21:13:44 -0700 (PDT)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab2029eso1780510d50.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 21:13:44 -0700 (PDT)
X-Received: by 2002:a05:690e:4881:20b0:66f:c1bc:87f5 with SMTP id
 956f58d0204a3-6717fdf309emr1366552d50.78.1789877624271; Sat, 19 Sep 2026
 21:13:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hsing-hao Li <me@lizi.moe>
Date: Sun, 20 Sep 2026 12:13:33 +0800
X-Gmail-Original-Message-ID: <CAGFxjKKqxxmtkqEhPzQJg=XWTpom1RuwLQ7-OBCbuX7BynxVkA@mail.gmail.com>
X-Gm-Features: AcwNN1WdMdMhoKnEx_xLS2HGH0J4NT-96FKmTioQVZ9YXcH-svEmLRcrvRu3R5A
Message-ID: <CAGFxjKKqxxmtkqEhPzQJg=XWTpom1RuwLQ7-OBCbuX7BynxVkA@mail.gmail.com>
Subject: drm/msm/dp: d858770e86e7 backport to 6.12 on SC7180
To: kumar.singh@oss.qualcomm.com, lumag@kernel.org, srini@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am investigating whether d858770e86e75bf78429b9f5210b7556ef431033
("drm/msm/dp: return 0 from audio_prepare when cable is disconnected")
should be backported to 6.12, and which adaptation is appropriate for
the older hw_params callback.

On my Lenovo Chromebook Duet 5 (Homestar, SC7180), running Debian
kernel 6.12.107+deb13-arm64 (Debian package 6.12.107-1), with
PipeWire 1.4.2 and WirePlumber 0.5.8, restarting
WirePlumber with DP disconnected reproducibly produces 20 failures
per restart. Four restarts were tested. Kprobes identify
the caller as WirePlumber and show -EINVAL returned by
dp_audio_hw_params and propagated through hdmi_codec_hw_params.
An instruction-offset probe, checked against the loaded module
build ID, confirms the !power_on branch in all 20 calls during
the final restart.

The observed impact here is failed disconnected-DP parameter probing
and repeated ASoC error messages. Internal speakers remain usable;
I have not reproduced the dummy-sink symptom described upstream.

In 6.12 the callback is hdmi_codec_ops.hw_params, before the LPASS CPU
DAI and component hw_params callbacks. Returning success therefore
allows those subsequent callbacks to run. In current upstream the
check is in the DRM bridge audio prepare path, following the generic
HDMI codec conversion in 98a8920e7b07.

Would an adaptation retaining the power_on early exit but
removing the EINVAL assignment be appropriate for the old callback,
or is any additional change needed for SC7180 LPASS?

I haven't yet built or booted a candidate backport. DP audio
playback and hotplug testing are also outstanding. The results above
describe reproduction on the unmodified kernel, not validation
of a fix.

AI assistance is involved in the source review, analysis and
polishing the message.

Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6F349CD1
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788735131; cv=none; b=M5gRNWg/hJn7upqdH+n6bxCAKaSeKvoiZ+Hxggf8d9YxjKT7tcucRLa5/K8iieHR/QSFDZM3qXmRBAT4inUL3oWTrFRigxMpnuW7pQqDnBXJOBIX7Igmrj0FnLrE8OnEdiFkowTP2qeyleIZNnLbA2b27ydvi54J2g7bIZfztNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788735131; c=relaxed/simple;
	bh=aAPHS2opfYawikamztQMMQNDJgEVw0HzpkRM5MM8ZRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o9XCOm6cWBe+AjLLIyVCBc0VfPwtB5LsaMX1XZmEaiGY0hdV84aPSfgoG3hnlQMPnTWtzKg74qrCsXRmV5kMH/CK0Dva7+2NhOiLGeW807NSn1PgqsIf0dJ6Ylx0SRtSCOJYt1Mi+Is7O/F49pe1rTBx5DgHeiyxuqgcCVWeOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Raq7jy7N; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Raq7jy7N"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-930f618435cso338460285a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 15:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788735128; x=1789339928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mIJN/sAwYOGsx4KiLS2BjZwfic1XFdCFhhrLHJS/Pvk=;
        b=Raq7jy7NoiNm6DWMNAbmSu43KXlbMXFer11S1pUP1Lqv5l1FdIWEQYwV1OHmWLkjLt
         lGMibQrLMmIwDjj2P6yV82kv1+GlwWJYxLqLb5HTaXblgqmQWz3vUT4zLbvuGO17jpWT
         6WY7QzhhtOtbGgMt/IYA0iBQD1iT/kEmcEoPztUOZYbQzQwVeTXA0QSXy/b94wIvTBiM
         dvHqdNJjw4lU3LJ4H7VTMzH1pKnHs9mcvHf459jOZW+eVRM8FO3+IFm8dnG3A+ATVH3y
         WJ4+7ZK2T0KZFauXMD5zlPzuLf4Z90Md8JJV/pNxkIWIjBlLVezheUk+2UnuAeCvxICc
         j9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788735128; x=1789339928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIJN/sAwYOGsx4KiLS2BjZwfic1XFdCFhhrLHJS/Pvk=;
        b=Im/H9HC+gQUmqzIwIBsXpl2GcbFYuWsrlBqVQDWMTxRZEcrCsZSqO9TK2kZMym1b4E
         igBEDlnLzk6Et5YV7LO6HPo/4EDbjawTzTY+r2N/0SpsbVb4jRSkAHjbnmkv1HttOszA
         Bhs0dixkluhQRJ9ZtyfqB6o0ar9RrTuliM0pxuYPN9VNWZYmGX9RkJf/VAiGibnSo4Hm
         82R2lyumGjZG/e8Ker+63KtS5yovxx67mAVEeEEu9O6sQVCaO/HWm1dFX27htNlmykQG
         LFy2fNT7qUg8LP8nsSFah7UPQgVWyjc773i6xe8Y1su6bE+O6qiF28JzWM9D50tBY9sR
         tssg==
X-Gm-Message-State: AFuF++lrgf+eCo7tkVMP+Q1TS67cuWjlnClIlX9Uw1G4ZXClvBNv20wm
	uFHAhE4L+eCEERxCentzTQqU6Ioq05jijW1YiPOvlRRmz8b5BcucY2U8
X-Gm-Gg: AYBFou3fAUmWDXrQlyyiNszsTrWl0b9LJ9C9Ziqe3z7c08e7r4EFRI+msG1evp2Z5oz
	mXOVtDxJuMHfjRctllSobkoONZYhiBmI8A4ENnk0vxK6iP9m1vNXaiJfeIAaD96B/RExqLK/TQZ
	oypRBSrSnnOaSv6Ed445GBdeNGYLnrdeSOVWAs68khkQiE8JHafyku9aCQcvKmGUttEMWJVXVtu
	2QUBC8QHXV8HtnrFqgReVkbEtCDc4VKZgdhy6xycdmTxkgR2PE6LFsc+TuZXjgXoCdCfKk27wv1
	fCZLJYgQ0A2m3Vf2wPLGegpyaErIF0cB+DCmoRYmA7Gklrx2F/BcVj291RgOGdTqHZPXySxzdHA
	JK8Fyy9+4qnueO0Ful3kFHRqPE6Ay+Sj2Uytfezy+mS3ntGJ+/UyloyNMplOupBjpncGmz1VMLR
	WPBbxkUNOXSfHRWNn2+our9EWuy3W4AlpCnWnIbSzDMXvgar/fmq7X5laD2TZt9+9y6iayEykVm
	xUfSg==
X-Received: by 2002:a05:620a:d48:b0:939:6dea:3749 with SMTP id af79cd13be357-939804a747amr1501625985a.45.1788735127989;
        Sun, 06 Sep 2026 15:52:07 -0700 (PDT)
Received: from localhost ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9399429b97esm444434285a.29.2026.09.06.15.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:52:07 -0700 (PDT)
From: BurningHoryd <sjunhyuk1@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: SM8250 USB-C DP alt mode: DP AUX times out in reversed (CC2) cable orientation
Date: Sun,  6 Sep 2026 18:52:06 -0400
Message-ID: <20260906225206.2994952-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I'm chasing a DisplayPort-over-USB-C alt mode bug on an SM8250 (Retroid
Pocket 5) board and would appreciate a pointer, as it looks like it may
be in the nb7vpq904m redriver or the qmp-combo DP AUX path.

Hardware / software
-------------------
- SoC: SM8250, qcom,sm8250-qmp-usb3-dp-phy combo PHY (88e8000.phy)
- USB-C redriver: onnn,nb7vpq904m (i2c, typec mux/switch)
- External sink: VITURE Beast XR glasses, 4-lane DP-only (pin assignment
  C, TYPEC_DP_STATE_C), HBR2, 1920x1200@120
- Kernel: v7.2 base, plus three local qmp-combo patches that are the
  subject of a separate downstream review (keep usb_init_count across the
  DP-only mux switch / skip USB3 power on/off while already in DP-only /
  the residual pipe_clk-in-common timeout hunk). The AUX failure below
  reproduces with those applied; I have not been able to bisect against
  pristine v7.2 because plain v7.2 has an unrelated regression on this
  board (qcom_pmic_typec now requires connector/vbus-supply, which the
  board DT lacks, so DP alt mode never powers up at all without a
  separate DT fix).

Symptom
-------
Normal cable orientation: DP alt mode works perfectly - link trains,
1920x1200@120, stable.

Reversed cable orientation (Type-C orientation = reverse / CC2): DP never
comes up. The DP alt mode HPD notification reaches msm_dp
(msm_dp_bridge_hpd_notify status=1), msm_dp starts bring-up
(msm_dp_display_host_phy_init, phy_init OK), but the very first DPCD read
- SINK_COUNT at 0x200 in msm_dp_hpd_plug_handle - polls for ~4 seconds
and never gets a reply:

  [drm:msm_dp_hpd_plug_handle] Before, sink_count=0
  [drm:msm_dp_display_host_phy_init] core_init=1 phy_init=1
  ... ~4 s ...
  [drm:msm_dp_hpd_plug_handle] After, sink_count=0
  [drm:msm_dp_bridge_detect] aux link status: 0
  [drm:msm_dp_bridge_detect] failed to read caps

msm_dp then gives up and the connector stays disconnected. Link training
is never reached. Stock Android on the exact same hardware works in both
orientations, so this is a driver-side issue, not a board/silicon limit.

What I've verified (instrumented kernel, dev_info in the phy + nb7 set
paths)
------------------------------------------------------------------------
- It is NOT a state / refcount / mux ordering artifact: a clean
  reverse-first plug (fresh boot, reversed cable plugged before any
  normal plug) fails identically.
- On the reversed plug, in order:
  * qmp_combo_typec_switch_set(REVERSE) runs, qmp_combo_com_init(force)
    writes QPHY_V3_DP_COM_TYPEC_CTRL = SW_PORTSELECT_MUX|SW_PORTSELECT_VAL
    (0x3).
  * nb7vpq904m_set() runs for TYPEC_DP_STATE_C with reverse=1, writes
    AUX_CC_REG (0x09) = 0x1.
  * qmp_combo_typec_mux_set() does the DP-only transition, com_init(force)
    again (mode=DP_ONLY, TYPEC_CTRL=0x3) - this happens AFTER the nb7 DP
    config.
  * qmp_combo_dp_init() -> qmp_v4_dp_aux_init() runs.
  So the PHY and the redriver are both configured for reverse, in a sane
  order, before msm_dp attempts AUX. And AUX still times out.
- qmp-combo has no DP-AUX orientation register that I can find - AUX
  orientation on this design is entirely nb7vpq904m AUX_CC_REG.
- Inverting SW_PORTSELECT_VAL and/or nb7 AUX_CC (making the registers
  bit-identical to the working normal-orientation case) does not help -
  reverse still fails.
- Forcing repeated full qmp_combo_com_exit/com_init cycles during the
  DPCD poll window does not help.

The one thing that changes anything
-----------------------------------
I added a knob to override GEN_DEV_SETTINGS OP_MODE in the nb7
TYPEC_DP_STATE_C branch (it normally hard-codes
GEN_DEV_SET_OP_MODE_DP_4LANE):

  OP_MODE = DP_4LANE (2)      -> DPCD read: 0 successes (many tries)
  OP_MODE = DP_CC1   (1)      -> DPCD read: 0 successes
  OP_MODE = DP_CC2   (0)      -> DPCD read succeeds intermittently
                                 (~1 in 4 plugs, sink_count 0->1,
                                 connector goes connected briefly).
                                 Link training then fails, which is
                                 expected since DP_CC2 is a 2-lane
                                 op-mode and the source is driving 4.
  OP_MODE = 3, 4             -> 0 successes

DP_CC2 is the "flipped orientation" op-mode. It is the only setting that
ever gets an AUX transaction through in reversed orientation. That
strongly suggests the nb7vpq904m SBU/AUX switch is not being put into the
flipped routing for a 4-lane DP session - AUX_CC_REG alone does not seem
to do it in DP_4LANE op-mode - but I don't have the full NB7VPQ904M
register map to confirm (the public datasheets are image-only).

Questions
---------
1. Is nb7vpq904m's DP_4LANE path missing SBU/AUX orientation handling
   that the DP_CC1/DP_CC2 paths get implicitly from the op-mode? Should
   AUX_CC_REG be sufficient in DP_4LANE mode, or is another
   GEN_DEV_SETTINGS / AUX register bit needed for CC2?
2. Is there an SM8250 qmp-combo DP-AUX orientation step that mainline is
   missing (something the downstream PHY driver does for a reversed
   4-lane DP session)?
3. Any known-good reference for reversed-orientation 4-lane DP on an
   SM8250 + nb7vpq904m board?

I can share the full instrumented traces (normal vs reverse) and test the
register map if someone can point at the right bits. Happy to turn a fix
into a proper patch.

Thanks,
BurningHoryd

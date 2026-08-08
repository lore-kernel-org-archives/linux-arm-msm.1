Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4899430C152
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209207; cv=none; b=WN2GmSgGBZzaF++tckS2AgzSU4ovJKKo+uSg6oNpL34RerYZ0oWlT1fu95QU3GJyin2zYTvotW1uOmidZ5I8ctLYb8OuJ3YYjf4BY8Rlw4WWs1DWXIC/0FIU1wXr3IYSpDsun+d3pShHnHr30seiLdlsHvCuqOB+kG3UGoiEy/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209207; c=relaxed/simple;
	bh=CmcaR6/ABzIXfL+K9Bw3YQJDPZRLUNl9mrhb+l/OLXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q13xms64d0okq/BFM80Y8bPX+NEovo3BIBmYHG8qYsSez3b93bPWnv1Il5n4YYbK41rUSxivi0qSIfgcMq3s682qFZm+Oua1tVfcUBIvELvZFWU22aYTbgWhzm9f/JP9hSVwOUMAOBtDV5eStefEOr9PvDu4FuiX22NKussEWZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da6TjQFq; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da6TjQFq"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so3532516d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786209205; x=1786814005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOPf2FedcS2eOFBS8+PnivGCIYlDP4XiFxFJYIs9CDY=;
        b=da6TjQFqhJGMH5k0DmC2Z/bHODT+YDAffi69B+MuEZ5SCdjj1eZTXtLMyachPBy/1R
         xJJxl35iAq8j7oTpPe7Bj+R9EzU2fn2kpJCXO4ysfxVths+hXWXY9jGkPaNUfZ9HQssv
         G3T1Q4ENarlPVtlLcB0TtC/UFqUN6wf8YULvrs8gPxXZPytV0Ede70hoHr3tTc+6N3NW
         ZGmth5GE3T3ySSyMH6ixW9dFh709kNIwbsE5aMPcQsKXYLKuFqJlCxD0OdCrdZ0S+Sum
         83dO1bm/rYbQbH/+7vExnxBYKXcSP6V0zxfc6unPdoh5nneHEGro2cL7TAykQg7RiXsc
         WbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786209205; x=1786814005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOPf2FedcS2eOFBS8+PnivGCIYlDP4XiFxFJYIs9CDY=;
        b=DvC2ecXVV6i5ypQOPuDJ61vdWD8F88f7QLk7139IlwTFVfkJodZb+aDDuzYf8Tsoq6
         oiCS7GTSMMawH3/tl9XshFEANtO6N+RudUM9irp9fE4NN7tRlQbhIOgtw/nuJpMQCol/
         qFWnehGMfPAjyp9ywOYHgFVKwRuIWNKmk1IDZYMFNj45D/862idQEdUMmhr2hu1nOntX
         BTjddG7gHuUibJvBueHh2QjFtpWiyAEzZBQ6Ks5BwI4JoRUMoGwOpiJE1PSfQLoLovnF
         X3I7ZIhbo63z7Xqls1CH970siBN5FffIiv9z/lW2WNAkHg3rXDB33/35J539tJ9KFDJ0
         yoaw==
X-Forwarded-Encrypted: i=1; AHgh+RpHrndU1aP78X9eelaKDcDFqcF8HwWFr/e/Wvdw5v/rpMn8zl2ABAc06tmi/TaXP4erL/KMoqTMzhk41/Bz@vger.kernel.org
X-Gm-Message-State: AOJu0YxF5Nv06PiL1rjSF3vjqYTvi/XkxGajtvstrYnuU6Dw0qsXBP85
	fBcf7iZ8KQKWjkf2YddP7gWfImGVxa4BEJd5HNINZL++vldhhbeda1kp
X-Gm-Gg: AR+sD11woK6HEN0pVX5OV0ig4eq00umElkRKht0IM/MksGFMAlgqQKBKbNA38Fo/VsA
	UW8j18K1hGm3WE5skSn0w8WIQRohvJyQPyA2IkMlpO+pqp+6axL73o32bQU/PmoKjB54OZQHTfY
	+xS6dH+wgqbHvFGDfHuwPw2HcD2BeH6qNtvix8LrweMdLhdhpqNso9FWFWdOaAOgXnKIW5ZdZLm
	9P6QDqPkH6vWjKpOIWqFkm/oVzjcIOILvKozKJ+BhVLK99noJ/ctdaiFeETbHc70lBw8IMA55SB
	QWMdQNYgvI+a4Y/v3xHGr97HFk+ZI9qvRaHK0E9rSsFDrAP9/GhkDLSkFLkwCcw1jEA3nn/dEoL
	ntfZztuiTX7cmwBcqo8iOjEt5HO/yOY2YnFFyEW2S1HsUN41I9Er/qY2g2/wrroy7gXo+alTTR9
	0jUbG2nhTMlSQomUfc7RwwV66TcUSgn09im+b0kWG85U8TgKuCxYJ58GcJ5AcY+Pcg7Z9B9qyjQ
	Jn6EJ7B8cYrYclAK/ODAOrDVSsNMaFoOed4ZfRpEx+gUuacCxH+zxL93JOS5lSSCCo/AKLxUw==
X-Received: by 2002:a05:6214:4108:b0:907:888e:380c with SMTP id 6a1803df08f44-908813741c6mr361668286d6.26.1786209204977;
        Sat, 08 Aug 2026 10:13:24 -0700 (PDT)
Received: from JesseofTheNorth.internal ([2600:4041:502b:ea00::1408])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a91b5899sm34499566d6.17.2026.08.08.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 10:13:24 -0700 (PDT)
From: Jesse Casco <jesse.casco@gmail.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: glymur eDP PHY (v8): link trains only at HBR3, all lower rates fail
Date: Sat,  8 Aug 2026 13:13:21 -0400
Message-ID: <20260808171321.133028-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Abel,

On an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite Extreme) the internal
eDP panel never comes up on mainline. It is the link rate: the v8 eDP PHY
appears to bring up a usable link only at HBR3.

Tested on linux-next next-20260713, next-20260803 and next-20260807, where
phy-qcom-edp.c is byte-identical -- so not a recent regression, and the May
2026 series (eDP low-vdiff LDO config, unified swing/pre-emphasis tables,
eDP/DP mode switch) is present in the tree tested here. The sweep below is
from next-20260803; the machine has since run next-20260807 as its daily
driver, where HBR3 still trains every boot.

PHY: phy@faac00, "qcom,glymur-dp-phy". Panel: SDC ATNA60HR07-0.

Rate sweep. Same kernel, same DTB, same PHY driver; only the requested link
rate forced (one line in msm_dp_panel_read_dpcd(), msm rebuilt as a module
between boots). Four lanes throughout, which the sink and the DT both allow:

  link rate     clock recovery (TPS1)   equalization (TPS2/3)   result
  1620 (RBR)    FAIL -110               -                       no link
  2700 (HBR)    FAIL -110               -                       no link
  5400 (HBR2)   pass                    FAIL -110               no link
  8100 (HBR3)   pass                    pass                    panel lights

HBR3 trains on the first attempt, every boot. At HBR2 clock recovery succeeds
and the sink then requests voltage swing 0 / pre-emphasis 1 on all four lanes
and never reports EQ done, through the full retry budget, with the driver
programming exactly what is asked each time. At HBR and RBR clock recovery
itself never completes.

Why the panel never comes up: the sink advertises HBR2 as its maximum, so msm
correctly selects the one rate that half-works.

  DPCD 0x001 MAX_LINK_RATE           = 0x00
  DPCD 0x00e TRAINING_AUX_RD_INTERVAL= 0x84   (ext receiver caps present)
  DPCD 0x2201 ext MAX_LINK_RATE      = 0x14   (HBR2)
  DPCD 0x010..0x01f SUPPORTED_LINK_RATES = 1.62 / 2.70 / 5.40 Gbps, no more
  DPCD 0x002 MAX_LANE_COUNT          = 0xc4   (4 lanes, TPS3, enhanced framing)

That advertised maximum does not close against the panel's own preferred
timing: 2880x1800 @ 120.000169 Hz, pixel clock 709.633 MHz, EDID declaring 10
bits per primary colour.

  10 bpc -> 21.29 Gbps   HBR2 4-lane = 17.28 Gbps  123%  does not fit
                         HBR3 4-lane = 25.92 Gbps   82%  fits
   8 bpc -> 17.03 Gbps   HBR2                      98.6% fits, barely

So at the depth it advertises, this panel's preferred mode cannot be carried
by the maximum link rate it advertises. It currently runs at HBR3, four lanes,
output_bpc 10, no DSC. I have not read the panel's DSC capability registers,
so I cannot rule out that HBR2 plus DSC is the intended combination -- if so,
that would explain the advertised maximum and I would be glad to be corrected.

Forcing the link above that advertised maximum is what our local tree does,
and it is why this laptop has a display at all -- but it is not a fix, which
is why I am reporting rather than sending a patch.

One observation, as a question rather than a claim: of all the revisions,
qcom_edp_com_configure_pll_v8() is the only one in which HBR2 has no PLL
programming of its own --

  rate   v4 hsclk_sel/dec_start   v6            v8 (glymur)
  1620   0x5 / 0x69               0x5 / 0x34    0x5 / 0x34
  2700   0x3 / 0x69               0x3 / 0x34    0x3 / 0x34
  5400   0x1 / 0x8c               0x1 / 0x46    0x2 / 0x4f  <- falls into 8100
  8100   0x0 / 0x69               0x0 / 0x34    0x2 / 0x4f

DP_PHY_VCO_DIV does differ between the two (0x02 vs 0x01), but
qcom_edp_set_vco_div() uses it to derive the pixel clock rather than the
serial rate. Is the shared case intentional for v8, and if not, are the
correct v8 HBR2 values available? It would not explain the RBR and HBR
failures, whose cases are distinct, so I may be looking at the wrong thing.

Ruled out by experiment here:
 - the device tree: our board file and the merged upstream one fail
   identically; link-frequencies allows 1.62/2.7/5.4/8.1 in both
 - the drivers/gpu/drm/msm/dp rework between next-20260713 and next-20260803:
   an rc6 kernel built with the 0713 dp/ directory fails the same way

Separately: when eDP training fails, msm_dp_display_atomic_disable() pushes
the idle pattern into a link that was never enabled, and on glymur that
resets the SoC. I am sending a patch for that to the msm list alongside this
report.

Happy to run any test here and capture logs over netconsole -- a retail
machine with no firmware unlock, but I can rebuild and reboot it freely.

Thanks for the glymur PHY support -- everything else in it works here.

Jesse Casco

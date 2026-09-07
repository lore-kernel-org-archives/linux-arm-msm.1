Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55692211A09
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763231; cv=none; b=OherTCwbadnvKRlfkahf3INnSdvQNNmsfCC4UM+atnMb0CyYvVkvv1bRuleVbIFxlWFqH+o8daoYydaoUJQTRsrvzREKx8vktXU6C5NTxzF77q1fzq1OiIfi0ioPfOambtw+Muth0lK8VsgkpXv0qNDy/M+f4xDZPPnlZ94dXKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763231; c=relaxed/simple;
	bh=KZG4CZdqqlc2ZfNiTN6smnfyx8nbzSO0sz8KTKaKBGw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cstDrk/b3uS2yaYVWfZ8r1uUM+xtUXI1IxAq2R38DnaCh2JUlMMgt6kDQAP19JsseNlg+oQZP7gp+qbFnzV/8Smv+rSY1d+RAsS0qlTEf7nAf/LBKq0ttQgRFQhiJCUVMQ5sGd7VZnje8t3+130QUcbFAhg4trp0vb0yhaYWZu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aXssTUcc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aXssTUcc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4858303de5dso3875054f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 23:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788763227; x=1789368027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SU9/kaGiibd6mGhjdwN2A8ofGPaPGTIVHRIR2UuuB8I=;
        b=aXssTUccpPNs/WwG5O8siJjd+kumLoO3u17gTyftZKtqpPFerJqR5Bxi8hw5YsycSc
         9mzKnT+o5Jppf5S3SBQxf1aHUSE/GjY7GIS7XkPiyiRGQ9om/EXbhvNfSCo7ajlW3LsE
         3NYoZamkScTQUx13DHDHWo2wVS9Lq4hyJekgXz7qiNJrMsichIqhvSbBaJet1VQwtyQx
         BhzoVz5dfS7TvHSbXPhII7lBtiSNNwp4EV7Y+bBiv3N5KSErvQCvugzAkJG27zVDPXex
         FR5e+QUzexg0PVnXRRGcwcXMd3p9nHNfmmM0r0glxAnoHcCJzvi3r/K4vBY+zsS3iB0h
         +UnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763227; x=1789368027;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SU9/kaGiibd6mGhjdwN2A8ofGPaPGTIVHRIR2UuuB8I=;
        b=dxtovk9md5DRV5ofG55YSqFuqTBxyenWycMrL0GyAR5PVGSQ5PGxwcgoqdYxb+NZYR
         EVKHJgtdIZjNRS8FtFmcgxXD9oSi1XSutFlNIbgbA3/UgmFawo9NpcnK2OQy3daJ6Ieu
         w+AZ3Z2vEXrSKC5FXJ2AEub+cVSVhYvaZCS2IrW/4bam1ZoyWHA6Q+QA+XM6SCzw9Vsd
         gp9epEaHzrslFXw74Tpjg2OoEQT0vc2dqhE4vmQDCkrAFpXR6uf/Cu8xBeekLwzl/ses
         Ya7UOX74JpTldz53ts2mGR/LDW+sbc4/o8AfxFn2I54ZnuOtFD0D7T5B3rGA1xln2pw4
         1b0Q==
X-Gm-Message-State: AFuF++kPLvijjQJtcuMvI8FyM519NdGyEkZcq1FbGdkgSEE8K2GFaEqO
	/bOXK59i/WAkVDK+6GahAd1lZJSW6mTE4OQaYZ3M7McvWp6Med26pWG4Dk7p4a+tM+w=
X-Gm-Gg: AYBFou0JB6jycAok5Tsvds2rBHfpZvY2DNSFUusXvCCOoOGMK94zFJMvQoOLIVCkLl3
	Ht7hF/TY6n+5g3eXHQaVPARTCwtsjXrdzvireVHu3JIjWCW/vMqbpzI3TaADhOtziJKJA50eGux
	RjPlUbJUOiFa1sz7i4WKOmCmtlEaN2toyiWbBv06zmS/ZrLowpCVy+7f3cX4ootjA/4QxeHkCpv
	2miwkrgFP2YOZw2SUERybjTvv08TzQpFjGMMjltTyTsQ+ZzyH6qAfsftT9ZE4QN2VgJ2Is713XX
	9tvPeAlSMe0d4uN6ChM0MztSpLdxkdChLdIGWzz+1+ZqLSJdvEgVGq8G4DrnJtahrlZyClxCXsK
	N9S69/fDSiu4C0im8ou/kXWaVcw+EX6k3qWCzNwkeb+rDnBDtqyZqrXhAY74nx/bGU9W0R9CfKe
	wcmyJ6nlmLypt09xDGZJS+THFJOpR3ZV9E1eDuPwv2XyqIHPYpNtWIR+rjPgCbT30O/Gj8DdqzU
	H2kWOwIV75Kk4DkWzgAVC4k+fzVIDkG3KWTO5tCWoc=
X-Received: by 2002:a05:6000:1a8d:b0:485:8c16:a32f with SMTP id ffacd0b85a97d-4858c16a6cemr17808883f8f.36.1788763227160;
        Sun, 06 Sep 2026 23:40:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:74d7:9035:e283:b480? ([2a01:e0a:106d:1080:74d7:9035:e283:b480])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm26981837f8f.21.2026.09.06.23.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:40:26 -0700 (PDT)
Message-ID: <f0fc4211-2040-4115-9847-6e5cc3fe8161@linaro.org>
Date: Mon, 7 Sep 2026 08:40:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: SM8250 USB-C DP alt mode: DP AUX times out in reversed (CC2)
 cable orientation
To: BurningHoryd <sjunhyuk1@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20260906225206.2994952-1-sjunhyuk1@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260906225206.2994952-1-sjunhyuk1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 00:52, BurningHoryd wrote:
> Hi,
> 
> I'm chasing a DisplayPort-over-USB-C alt mode bug on an SM8250 (Retroid
> Pocket 5) board and would appreciate a pointer, as it looks like it may
> be in the nb7vpq904m redriver or the qmp-combo DP AUX path.
> 
> Hardware / software
> -------------------
> - SoC: SM8250, qcom,sm8250-qmp-usb3-dp-phy combo PHY (88e8000.phy)
> - USB-C redriver: onnn,nb7vpq904m (i2c, typec mux/switch)
> - External sink: VITURE Beast XR glasses, 4-lane DP-only (pin assignment
>    C, TYPEC_DP_STATE_C), HBR2, 1920x1200@120
> - Kernel: v7.2 base, plus three local qmp-combo patches that are the
>    subject of a separate downstream review (keep usb_init_count across the
>    DP-only mux switch / skip USB3 power on/off while already in DP-only /
>    the residual pipe_clk-in-common timeout hunk). The AUX failure below
>    reproduces with those applied; I have not been able to bisect against
>    pristine v7.2 because plain v7.2 has an unrelated regression on this
>    board (qcom_pmic_typec now requires connector/vbus-supply, which the
>    board DT lacks, so DP alt mode never powers up at all without a
>    separate DT fix).
> 
> Symptom
> -------
> Normal cable orientation: DP alt mode works perfectly - link trains,
> 1920x1200@120, stable.
> 
> Reversed cable orientation (Type-C orientation = reverse / CC2): DP never
> comes up. The DP alt mode HPD notification reaches msm_dp
> (msm_dp_bridge_hpd_notify status=1), msm_dp starts bring-up
> (msm_dp_display_host_phy_init, phy_init OK), but the very first DPCD read
> - SINK_COUNT at 0x200 in msm_dp_hpd_plug_handle - polls for ~4 seconds
> and never gets a reply:
> 
>    [drm:msm_dp_hpd_plug_handle] Before, sink_count=0
>    [drm:msm_dp_display_host_phy_init] core_init=1 phy_init=1
>    ... ~4 s ...
>    [drm:msm_dp_hpd_plug_handle] After, sink_count=0
>    [drm:msm_dp_bridge_detect] aux link status: 0
>    [drm:msm_dp_bridge_detect] failed to read caps
> 
> msm_dp then gives up and the connector stays disconnected. Link training
> is never reached. Stock Android on the exact same hardware works in both
> orientations, so this is a driver-side issue, not a board/silicon limit.
> 
> What I've verified (instrumented kernel, dev_info in the phy + nb7 set
> paths)
> ------------------------------------------------------------------------
> - It is NOT a state / refcount / mux ordering artifact: a clean
>    reverse-first plug (fresh boot, reversed cable plugged before any
>    normal plug) fails identically.
> - On the reversed plug, in order:
>    * qmp_combo_typec_switch_set(REVERSE) runs, qmp_combo_com_init(force)
>      writes QPHY_V3_DP_COM_TYPEC_CTRL = SW_PORTSELECT_MUX|SW_PORTSELECT_VAL
>      (0x3).
>    * nb7vpq904m_set() runs for TYPEC_DP_STATE_C with reverse=1, writes
>      AUX_CC_REG (0x09) = 0x1.
>    * qmp_combo_typec_mux_set() does the DP-only transition, com_init(force)
>      again (mode=DP_ONLY, TYPEC_CTRL=0x3) - this happens AFTER the nb7 DP
>      config.
>    * qmp_combo_dp_init() -> qmp_v4_dp_aux_init() runs.
>    So the PHY and the redriver are both configured for reverse, in a sane
>    order, before msm_dp attempts AUX. And AUX still times out.
> - qmp-combo has no DP-AUX orientation register that I can find - AUX
>    orientation on this design is entirely nb7vpq904m AUX_CC_REG.
> - Inverting SW_PORTSELECT_VAL and/or nb7 AUX_CC (making the registers
>    bit-identical to the working normal-orientation case) does not help -
>    reverse still fails.
> - Forcing repeated full qmp_combo_com_exit/com_init cycles during the
>    DPCD poll window does not help.
> 
> The one thing that changes anything
> -----------------------------------
> I added a knob to override GEN_DEV_SETTINGS OP_MODE in the nb7
> TYPEC_DP_STATE_C branch (it normally hard-codes
> GEN_DEV_SET_OP_MODE_DP_4LANE):
> 
>    OP_MODE = DP_4LANE (2)      -> DPCD read: 0 successes (many tries)
>    OP_MODE = DP_CC1   (1)      -> DPCD read: 0 successes
>    OP_MODE = DP_CC2   (0)      -> DPCD read succeeds intermittently
>                                   (~1 in 4 plugs, sink_count 0->1,
>                                   connector goes connected briefly).
>                                   Link training then fails, which is
>                                   expected since DP_CC2 is a 2-lane
>                                   op-mode and the source is driving 4.
>    OP_MODE = 3, 4             -> 0 successes
> 
> DP_CC2 is the "flipped orientation" op-mode. It is the only setting that
> ever gets an AUX transaction through in reversed orientation. That
> strongly suggests the nb7vpq904m SBU/AUX switch is not being put into the
> flipped routing for a 4-lane DP session - AUX_CC_REG alone does not seem
> to do it in DP_4LANE op-mode - but I don't have the full NB7VPQ904M
> register map to confirm (the public datasheets are image-only).
> 
> Questions
> ---------
> 1. Is nb7vpq904m's DP_4LANE path missing SBU/AUX orientation handling
>     that the DP_CC1/DP_CC2 paths get implicitly from the op-mode? Should
>     AUX_CC_REG be sufficient in DP_4LANE mode, or is another
>     GEN_DEV_SETTINGS / AUX register bit needed for CC2?
> 2. Is there an SM8250 qmp-combo DP-AUX orientation step that mainline is
>     missing (something the downstream PHY driver does for a reversed
>     4-lane DP session)?
> 3. Any known-good reference for reversed-orientation 4-lane DP on an
>     SM8250 + nb7vpq904m board?

This means the nb7vpq904m is _not_ responsible for the AUX swapping, other
boards have the wcd9395 or the fsa4480 in the middle to use the AUX line
for the USB-C Alternate Audio support, and does the swap.

Could you check in the vendor tree if there's any reference to those ?

Neil

> 
> I can share the full instrumented traces (normal vs reverse) and test the
> register map if someone can point at the right bits. Happy to turn a fix
> into a proper patch.
> 
> Thanks,
> BurningHoryd


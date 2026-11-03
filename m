Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713891;
	b=YIneI+bWvTc4OIs5DiLk2IvUFUCQTHiFEQvyo1fjQUGfOGbXoDEJTeSk2vOw+26tbH8W
	 NJaZoZF/CVKAOzqIv+vBUBYhxXKeEnMBlCoHpYjXxm7/wxN+kU68hv2Q1BxMIWeqr22mI
	 +l9uAkKnfkR5SNuVWtGKSLmbwh9DCzYJXnheHS9Z46TvXnD4PmTptm8IvbduNptpkoFN8
	 IyMNeErMTUyZcUebVAxoyTgw9tpd+hoUWFGerOc+aWJXHvs7hud7tuXxsfUG8qAy5ydy0
	 1o+vfgMH8GEvzMzz/0BzBULn0XwUXZf5KzL9S2WHyAANbdw8TtO4Eff1HLR/JM68LDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jHC5kGjbwQHUmw1E/Aen0JCdyqsz5/FnNe71zqbNXLQ=;
	b=pcRu1TK8csgS5GxGVFDfZgMStPOUOz9rrL7m3qxUFhETVKckZnZEtgQ2nA9bp+w67wXZ
	 /O60t3xdXCNeRXSz1voKcwEYBSW+xjERCVx0SB6TpJax4rees/1FSyYjbNgjCp6iLQ5Oe
	 pYMEmis3k4ypiKpfYJ2ImmujoQkz3tbW3vel4uyT2hbNlM5TvPLNmdRc/PozBmE241zoK
	 F1RhD5+o2y8CtHeFapKPxVj1ZYvtlVZhxWJTlbJn6AEIU824XQ+Z5+z0dzwPQXQAucdw7
	 5hv+5ip9+wZSgcZbCyvfJUdaXoufeCQjXrmTpdTJNzd+ckPnsDu+VX+qnLS/RJH8IMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zm1negIp;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DEC606EE8C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DEC606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zm1negIp
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-19305bcb72cso3108437c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713891; x=1794318691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHC5kGjbwQHUmw1E/Aen0JCdyqsz5/FnNe71zqbNXLQ=;
        b=Zm1negIpQGDf/Ln/oU0zxpMkFAiyc55LkNran22vq5iS8FGwzt+aUAi5HmvgVY250U
         oZpDOdVnHTtmrpXe3JchHhhO7HzcV5PkL1NLfw5aR5JwNY0LcuR5sq43I4s3kaygnYlt
         GF2CNVoTXD/oKjrgDvnfRFpcZdeOFfUNYNm8Iu/BWHxhC9l3ITxsdZ0sBf2X6qq1cHy3
         WGqi4C75gUCaqrFz468LBpulgmQo7qvVdEbSH23zu0SHESRVoIX8ICYhW3UWFnJR3Lc6
         tiCEREx/nBeZGdqcV6BGUrJI6RL7k1szrItQeonIRO2cUhBDYo0Un7mSVsrYzNvh5AyK
         zMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713891; x=1794318691;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHC5kGjbwQHUmw1E/Aen0JCdyqsz5/FnNe71zqbNXLQ=;
        b=byrpqsCah05FcfTbaQhq3wXcENM4SbDpMZX7hTGSSmrzjauIdR7nAXCx2pBXqsffVh
         AdQTdI+EYZGjbY8VJkUKuwvs2DRBmVpDdNkCl7ivXcpZNGcZrsR+jmFcZOxw8uB+vBJP
         y2eFSbue+C+4RWSuTUJO2EAawEeYZrSVISLz5JAeh893DbKK4Uah74mS8MjIFe8WBF8c
         tcZIT7LtN7UCCr1Fk41WPDzWzU12nnTe1HKw3uPkvVLBExkiaKYeGzTr6n9Kp/P0jX8g
         IVBAt5dgOjqie/Vmyf6Xw1yZAyykWHB75nK7f5lOz7Eekf9CidaS1mL/zBWXa+kb4wmE
         /PEg==
X-Forwarded-Encrypted: i=1; AKwUvBwrOgnWsM3cS/WIdIAQOpo7v985efvhMVnu9jJHHyzD8bKcuztIjF4ZRiDHEZXObLFf7RSIvLau5h9kl/Vr@vger.kernel.org
X-Gm-Message-State: APuU4Z/EHd1JXbXnQXomq2IXJmVHK3Ktgo68wZjdEYEeOkmIqOA0fRMl
	QuGUHXfRxfLKpyMyPDq6Lcsf6EOVQrkXk7ESi458hpRNlE0nn0K3MoK8
X-Gm-Gg: AYBFou0WeGWcMcnFCZcK1ok9xM1kPlOMpPwabYikgTBCb6chA1d7s5OgeQeqU/d/Ynf
	o4bnYIB0aUVis3vxRk1gB2mbvZPjWsJBN3CXG70bHAfu39KUCYEqvRdbCnmC8S/a+vD3E34fsoM
	Fw7Z5syKnCJPysk/xvfw3tJiro47wZdr5p72fBdf8s3tnka9qAvaPgpb9hC5VIF0FdPV4KPzi9r
	Cj+ICak60WOY2s9lV9yECcL06ufFd+2BUepYwZ9JPp11sSWpEjWE80dkuv2W6HI2kA5O7kjO8zF
	5OB3FDnSqqyIdWIFBsynV9LMcUJjP14OhWlRFoWddtbIjkq4wj2NjUodBc5DwBay473Lk/LA5UN
	bf8FZjzB9cblHj9NvfCJ6MjTYEj9KG1AhYRDw7ufysgAbmts6v0l2VLBjBsPqPD4YGpGTHQLKve
	1iENuhzTxRzAsxus+z+npPfLUD9Hx54wKoLRWh45iJaFdZIi51+3q3itvuR2i/iRIbbJE26ABmO
	CCesbZpuG1pg5N2pd17dOI7T+vCGmePDjaxBm3JGFDJ9hf5gcR4Xq8b9bM9uuB2lLeC9WoNLtaY
	SGIuC10+rQtaUDPZaHj0dyYCVVtpq1zICEpRZ7CbWyIycg==
X-Received: by 2002:a05:7023:d0b:b0:191:ac4:55a7 with SMTP id a92af1059eb24-1ac5b024d1emr20755825c88.23.1793713890250;
        Tue, 03 Nov 2026 05:51:30 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm39536340c88.3.2026.11.03.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:29 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Joonhoe Kim <26rote@gmail.com>,
	sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Tue,  3 Nov 2026 22:51:29 +0900
Message-ID: <20261103135129.1961-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-194253@kernel.org>
References: <20261102215121.738-1-26rote@gmail.com> <20261102215121.738-3-26rote@gmail.com> <sashiko-outbox-194253@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joonhoe Kim <26rote@gmail.com>

On Mon, 02 Nov 2026 22:08:43 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Can the controller get stuck on the UTMI clock after leaving a
> DisplayPort-only mode?
[...]
> 1. dwc3_qcom_set_role_notifier(USB_ROLE_HOST) runs while qcom->dp_only is
>    still true, so dwc3_qcom_update_pipe_clk() does nothing and
>    qcom->current_role becomes USB_ROLE_HOST.
> 2. dwc3_qcom_mux_set() runs next and sets qcom->dp_only = false (for
>    TYPEC_STATE_USB or TYPEC_DP_STATE_D), then returns early because
>    !qcom->dp_only is true.

This is partly right.

The replug case is a real gap. On the Lenovo Y700 Gen 5 (TB323FU,
Kaanapali), the USB mux state has always arrived before the role
change. But nothing guarantees that order.

In v2, dwc3_qcom_mux_set() switches back to the PIPE clock itself.
It does so when a USB state arrives after the safe state. Once
DisplayPort is powered off, the PHY leaves DP-only mode in the same
typec_mux_set() call. So the switch no longer waits for a role change.
If DisplayPort is still powered then, the PHY delays the switch but
the controller does not. v2 does not cover that case.

The other cases do not leave the controller behind the PHY.
qmp_combo_typec_mux_set() does not leave DP-only mode while the DP PHY
is powered ("DP PHY is still in use, delaying switch"). This covers an
in-place change from C/E to D/F. It also covers a USB state without a
safe state before it. In both cases the PIPE clock stays stopped, so
the UTMI clock is the right choice.

Your question made me find the opposite problem, though. After an
in-place change from C/E to D/F, this version clears dp_only. The next
role change then selects the PIPE clock while the PHY is still in
DP-only mode. v2 keeps dp_only unchanged while DisplayPort is active,
as the PHY does.

> [Severity: High]
> What happens here when CONFIG_USB_DWC3_QCOM=y and CONFIG_TYPEC=m, or when
> CONFIG_TYPEC=n?

Right, thanks. The arm64 defconfig has exactly USB_DWC3_QCOM=y and
TYPEC=m, so the vmlinux link fails. With TYPEC=n, the stub returns
-EOPNOTSUPP and the probe fails.

v2 adds "depends on TYPEC || TYPEC=n" to USB_DWC3_QCOM, as
PHY_QCOM_QMP_COMBO has. It also skips the mux registration when
CONFIG_TYPEC is disabled.

With this dependency, the arm64 defconfig builds the glue as a module.
If that is not wanted, the mux part could go behind its own Kconfig
option instead.

v2: https://lore.kernel.org/all/20261103135057.1682-1-26rote@gmail.com/

Thanks,
Joonhoe Kim

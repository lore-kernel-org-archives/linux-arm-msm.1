Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483599;
	b=18e6P0APUQ9j+FEEPRaWxX9vLqTQ2r3r1nALnjWbiTPCb4XZSwu8AxqvmU4gaArQngK/
	 P+WmQZgwVonIGDcmI/dkuhyUTWRNj2OZALohpwxqmOvmgm0PsQvvCcmc3REbQGGEWD6s8
	 BaWWNEXdj3tBCqopMid/nNQCqrizs3vIPFMjnJn0aOpwAP7ZajqM/MZ8eeUKkZr5C1TMl
	 G/Rz7iyMQ3++zVE9T6CkmDEnsKPpdD6Ph/0ZRQKz1GIDb0siawfGqFwQJqjee6ES3N+6f
	 AEZ1kwgrIDdlp8Le1C5HuRFSobnwYBSMD5r+2CPFP6xM/ojNFUD7eevjbLPmeeseJHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wvzeSRN1LnFuQrjCW1cXNkgqhbYpZ/s7WcQkRBfJar8=;
	b=xQ5WxZg+ILkYhvFA1+nMnog+1D1bfMMWaFr92CvFYxPB1hP3Cm61LZEyMnUpgG6Lf+JW
	 hyyC0oJxO1bP64evwYKdpKdVEn3TVetEEawj4A2oyWbN99ZDQ9LK6v5pntQmwrcFheIeQ
	 5EJc+sAK2HCXju/4prbdBkXkquL0rfI1sCt3nw84090dpE2dKadsrYwQP09KyANUCuv1b
	 Fb9afY7zgL/my6ivgYAQJtIkAORmadD75FE0by4nDum9ekMEaCv2Wt+itWgt2Qrg1B0dr
	 ffU+75USn3j5WnlME9yblm7W3SU35kHK6Aeb6WMzOfV0IAOk/P+/a3byIi8xI3evHKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6CgA7Xa;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA13606A338
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA13606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6CgA7Xa
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3704d30b84fso5347885eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483599; x=1795088399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wvzeSRN1LnFuQrjCW1cXNkgqhbYpZ/s7WcQkRBfJar8=;
        b=T6CgA7Xa+cVkv2hSHOQWAxxU+GzxdpUpsHUeocnBwjETXvZDphUtdviLfhq77/SV13
         Ph4BpYspEPzgljg7wu8frf+cR6OFDiHwQB7YLoQ35y4iwHMkg+BeGp3e6wHiq8/H+tK1
         9GR+aM1Lwnoyl+CEkrmpqwd4tkG5wl2ygPGz4ppj6jfrJFGiDJthObRp3iSlwwdI6Dct
         OUNFqgfEMshiZAKzhPp7AW45P317r5rbjIFVzYYg/1JbByenrqrAklz+Grdzwqszhh9R
         QKx/9CjeHcz0GXqlzCkFs+oXV7js+yQxjMjweAgjqktHgbjkTwqhX7iuvuZOr7ra8yIK
         /+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483599; x=1795088399;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvzeSRN1LnFuQrjCW1cXNkgqhbYpZ/s7WcQkRBfJar8=;
        b=0mzpHDtmAzd7cztHKdfyLIH7qc8fDg0r4GGnKCJN4De7O6xkn4r4f9UBursDb/pO/k
         3QEKAZrqEGsQxxAPeDTpsMUHqFCLq2UqqHGhKAt0E1Qf8KaxAbf6uhW2owagYPhFdazI
         FmMHMuU+bdQaYv4vs921hqkZ5FOyavSBy5YUpL0djqcrQkjW7ayBFvNBWyguiACLGs6h
         FOyUxftCOnAPcV277oLVF5aIUdmw3M1sEsEBzyjsqoOc9gDn0mib9wWS0HPu7SI+OrEr
         Qj7dBN4nIsdawsyTWoNs2aQfXxbRFQkqvm46tRJF5Rt5d3BappcvhmnJBDcDOLlfnGXF
         jL9A==
X-Forwarded-Encrypted: i=1; AL+hErFIxXp/EW4mhTSlz8iMqA3qYSVGoMtzht9Vzb73xz8DrkGt8u/S7cr0iX3ko0hyxMlEZVm3cfjN8p2fHg7X@vger.kernel.org
X-Gm-Message-State: APuU4Z9MctzVDcGEj3Yi2gtZYLUz+dWfv/gwJv5TMJfjtLtdM8Ug0gyX
	hFnZJPRyww6BC1KfVhijWJq4wSbueSTBYo5Xh0XMXWLGSO67A7iP/foH
X-Gm-Gg: AYBFou01JNPcGSAsHIJrsHkSH6XrWljf7yozufA9Z0O+0ueBbwocCt9GSEpL7l6Hfb2
	BKfAiu/3dQFGuv5v9dBa8uMLAyRkgWFrAET8c3YxyUG4vhlz/OIve0mzh0Cf+Z0fWxR+hfeNck9
	PeTPqn/1Xaya4Au4jNoFUlS4x5P+NM402kG8bZO79KXtOcI0IUUdP7plnhat42ZBJ4yIBXglscU
	Vz2BXZsHttWpeJ5ERfVxp2H8r1wT0nksOXnUtsZUrbnRnrI8mQh2nSDbquHp0I9A1btDkeSLnB1
	mH7rPsyHU5XJGXcEH6xQvmRoqqt5O419Sn3DQ4z3PsbYCDSAtLkW5ZlGc//Z4ekpkIJbhhFfmDM
	Cv3pjjcD4mDaTTr3qDembEHVn+clCD7F+SDBiDEqBRt+pZr4YO8jp/xkhTuEvVfPSHKhyjDuilN
	h+owbD0c3BtuBFvD2Wqkvu4g+Z4BT4zzR4Tpjo+8m9dXiaCZZX7lpBM5IU631Kp6VVUD4HFxn/1
	gCzJunuQx6dzdyfx5sxxDbV+XsgsqH2SeP/IyRb1CcKtOr2qHI5pYTojmVBd7CrfGBroJVPAPn5
	fw5uy22wgFlSe54GuMju5yRgH3zbGqZbp9t2fzomLyMjj66NCrkGelgyP3UNskM=
X-Received: by 2002:a05:7301:4902:b0:376:f63a:cb24 with SMTP id 5a478bee46e88-376f63ad124mr4989397eec.3.1794483598526;
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm50308720eec.23.2026.11.12.03.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
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
Subject: Re: [PATCH v2 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Thu, 12 Nov 2026 20:39:58 +0900
Message-ID: <20261112113958.166-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-195459@kernel.org>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-3-26rote@gmail.com> <sashiko-outbox-195459@kernel.org>
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

On Tue, 03 Nov 2026 14:35:19 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
[...]
> Should state->mode == TYPEC_STATE_SAFE and TYPEC_STATE_USB be checked
> before inspecting state->alt, and can gating qcom->dp_only on
> !qcom->dp_active miss valid transitions to DP-only mode?

Yes to both.

typec_altmode_set_mux() passes the DP altmode with the safe and USB
states as well. pmic_glink_altmode passes no altmode with the safe
state, so this did not show up in my tests. v3 checks the safe state
first and treats only the modal states with the DP SVID as
DisplayPort.

The USB states from the DisplayPort altmode driver (exit, removal,
configuration back to USB) all follow a safe state, so they now switch
back to the PIPE clock. Always selecting the UTMI clock for C or E also
covers a change from D to C/E without a safe state in between.

v3 also always selects the UTMI clock for pin assignment C or E. It
keeps the UTMI clock on a change from C/E to D/F while DisplayPort is
active. If the PHY switches then, USB 2.0 keeps working and USB 3 waits
until a USB state follows the next safe state. The PIPE clock while the
PHY is in DP-only mode would stop USB, so v3 errs towards the UTMI
clock.

> [Severity: High]
> How does the synchronization between dwc3_qcom_mux_set(), system sleep, and
> runtime PM handle the following cases?
[...]
> Could the clock selection check be performed inside dwc3_qcom_resume() (so
> both system resume and runtime resume apply any pending change before the
> core resumes), with qcom->pipe_clk_lock and qcom->pm_suspended covering the
> full suspend and resume sequences?

Yes, the cases are real. v3 follows the suggestion:

- The mux callback no longer resumes the glue.
- A flag set under the lock at the start of a runtime or system suspend
  and cleared after the core has resumed makes the callback only
  record the state in between (cases 1 and 2). If the suspend fails,
  the flag is cleared and the state applied right away.
- dwc3_qcom_resume() compares the recorded state with the clock
  selected in QSCRATCH and switches before the core resumes (cases 1,
  3 and 4). v3 has no cached clock state any more. A change recorded
  while the core resumes is applied when the flag is cleared.

I kept pm_suspended as it is, because the resume interrupt handler
uses it.

Tested on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali); details are in
the v3 cover. In those tests the mux state came after resume or needed
no clock change, so a recorded change was not applied on resume.

v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

Thanks,
Joonhoe Kim

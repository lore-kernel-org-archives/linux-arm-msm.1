Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657092;
	b=uOaGQuJXVozcvdxr+zLayOoK8avn4RFkh3d3XHAVEi5eeshN0sghR+NGhItQEqlAjGpP
	 k9q7RwOATa/w5KDUjhSauTETVMRs9Qq4y17jUau8ONr4pHrthMoUK4dsp5YXysb2G/u3a
	 fvJ4V3rkLcqYhX+AxYNfD/t38sxC7nbzSRkJs9B2w7o2UcZ2RkFfITWb9rAbtULlSPPd3
	 6MqD/0cfE5f1bjwUFib9IgC/S/o8jTk4qLypJ3KAFwbGI+oxEevT31K1O4+GBG2J/SVzJ
	 TYVEd2zcUp+cBQhQtDhXIMrwlf6cgDKMH6a8vcnvTByUlTrBKJOYrrPjRFr41lh2mlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3teTHgI6eBV8JhAHU1p2Vd46MVJYm6aXsAh7Xpa5ptw=;
	b=dzNugNsGNccn4bOYnDgCOhvRVn1PEAo7WBerKC5JCfqiKV8Xj5BNzhV0qJW/7vMa7Wgy
	 8PIBghNHQp7wgT4+a1Dkn9wuh7fR+qQ6+VVJKEbYfaBFEeAjpUYObK26y206LRskmFLDg
	 ni9RY8X40Dr2pBGLQpfOOVZIKtdOceTsMM9gMdRb4oF7hBQJm8i9PDpz/aN+ei8hrqWws
	 WABIKCsoMR9MxUPR35sSR+o+yJu7JtEX4mn26RlQAHb6khZV1KbabuMZqE67iDYB6caDp
	 gXhaLc/pGd6FQwjuJwnsT47ntXM0cZlG/VcsxKIAKchNoC8tJqZ9NtSovxQGlWORumA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sP8blN2W;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB231606A330
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB231606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sP8blN2W
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5000333eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657091; x=1794261891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3teTHgI6eBV8JhAHU1p2Vd46MVJYm6aXsAh7Xpa5ptw=;
        b=sP8blN2WkVtaBfINDqMiWwyea3rOBB913AD8NTnG2msbq27jreXWiIWejMC1k+vvuy
         bMfZ9GEcVFMC10L818A4xPZEAuMoshJKwubobg2hxc185L9svfh9VuE/vQw1il6F9scY
         YGRZzJV2xBNwaYDtyDMauk/I5LoXRH/5ovlziwkKSTxwz83wNCqPS42d32tTKUuw3soA
         lHXo6BJCPYlf0qJbUIRXO/kcDk//cZKtzyi8IHgCh4w53mL5s/OYM7oGKBz+5KzwuJgO
         3VjrH/HwgN6lzZym99sJ9Ov/DQlG8XgMZ0GfI1Gt7KSBT08igoepho2lLGtKR2UugpEu
         v2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657091; x=1794261891;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3teTHgI6eBV8JhAHU1p2Vd46MVJYm6aXsAh7Xpa5ptw=;
        b=eqwNV4s191WeS3F8OGN5rRc2UFN0SUX/Fp6Xn4miKhioIzKq0c+LFM9lxxKmZ0E6Ms
         EnQJOoPagxiMaORL9LVEf7cienYOnvB1P//v4qn+pKPz+spCYMrVOE6Z+LNkUnOyRk4x
         TCmwn/KaornfidYBc73w/CpEl7GTe9z6ZOt3OM/Eva/BL3vSDgxO0iu9XUqJktuJm+gT
         E19E6ayo1jm4kriezQO8sEUnXAyI5+fuRMGuFvxquTZz4h0gREiF+zk4+DwQVl19D07g
         ntEapa525uanUcQLUewEG3awFmWtdthQxcJyG46HT66fa+0Qp17GypsF6pCzooa0WzeJ
         piHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVFySGet58HCI/FH/IwT8jJqD7LNwWwwF7+ybeCjRtaZJqpEqwvsLEBOLVV7jXsj5HLLQKBjfdfTUxdFMF@vger.kernel.org
X-Gm-Message-State: APuU4Z9ebHTjRnqd5eKke9gTZoulJlrFeDHopk0JeZOf0r0zFsDujKQL
	clvaCJCqKVu/lyB3N7U2q8nUjifqDIvTZxflP8k+M0xcByjzJ3BJKfQe
X-Gm-Gg: AYBFou1klqqjNRd6UNe8lY4sQYsZQZeZzpjLv1UFjQ4f1rHonnFNArM4/TajfeqO71r
	9TUOhTsP/TX/JyvpRwO1WppL3Gh8ybBZEpKhGVjXHLgLG5wCkcpTMTVg0QMH6EJElSLjqbkby+l
	HS9xuL3YYk4bvlwVeym7NYBom3vc0sqz+lJGgObBxGA0Flj9xoUUOqDmDo8MkzUjXkNaU/yOlGx
	YXiU5M3sF77UkSPVvKs8jHZePEYVICIwmr+kkkgco6CUsf5EFu/fI5DC8HJj76EWiDddUc40NP0
	d206QxMgCnTGz5doLaSoCXEJtpsH7eIoMOlnhyC9tOEysBFQ2z6kh16lw2+yuCaizC6J4jLBttk
	9XWzOOR5T6WnzmB24F0XBEbx1B9+KsFDKSj1I6mhm1468XzhPWqvTcccyZ2aSO06W4+2ueh+iK2
	7r0dO9lau7s/TGkFs6C2sRt4fykVbMMx+UAJu4ogiCTJK4e1E7iHAS84uxn7PYtJOkxcW2W0C+W
	vR4MPzHO/o5Gg5vcWfHb5a9o2mz0Ap2Q54Px2qeq2PAhIvq0Q0Xwn/XUj44RebFk+Q8WgTaJlku
	IAHFmUGV7FuhFXurWdVlopezrDfgi6RB8+r2ZRf3MSAu
X-Received: by 2002:a05:693c:20c9:20b0:351:245b:d1e7 with SMTP id 5a478bee46e88-36a42061e10mr15018801eec.0.1793657090744;
        Mon, 02 Nov 2026 14:04:50 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm38466358eec.19.2026.11.02.14.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:50 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Tue,  3 Nov 2026 07:04:50 +0900
Message-ID: <20261102220450.1670-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <4d831e77-2123-46eb-90ed-dca3c580d47e@oss.qualcomm.com>
References: <20261023123512.1912-1-26rote@gmail.com> <4d831e77-2123-46eb-90ed-dca3c580d47e@oss.qualcomm.com>
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

On 11/2/26 10:32 PM, Konrad Dybcio wrote:
> On 10/23/26 2:35 PM, Joonhoe Kim wrote:
[...]
>> -	ret = qmp_combo_usb_power_on(phy);
>> -	if (ret) {
>> -		qmp_combo_com_exit(qmp, false);
>> -		return ret;
>> +	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
>> +		ret = qmp_combo_usb_power_on(phy);
[...]
> The USB sub-block provides the PIPE clock to the DWC3 controller.
> If we somehow enter DP altmode before DWC3 gets to probe, or if for
> any reason we need to access that controller (maybe debugfs reads),
> I think this will fail.

Right, there is no PIPE clock then. But there is none without this
patch either.

In DP-only mode, qmp_combo_usb_power_on() writes the USB tables over
the lanes DP is using. Here it timed out waiting for PHYSTATUS when
resuming in that mode, so phy_init() fails.

DP-only mode is usually entered after DWC3 has probed. The mux then
powers the USB PCS down under the running controller. So accessing the
controller in that state already has no PIPE clock today.

With this patch, the probe-after-DP case ends up in the same state
instead of failing in phy_init().

The missing PIPE clock does break things on Kaanapali: starting the
host in DP-only mode fails ("Host halt failed, -110"). I've sent a
dwc3-qcom series for this [1]. It switches the controller to the UTMI
clock in DP-only modes, like "qcom,select-utmi-as-pipe-clk" does
statically. It also makes the controller a mode switch, so
pmic_glink_altmode cannot set the mux before dwc3-qcom has probed.

[1] https://lore.kernel.org/all/20261102215121.738-1-26rote@gmail.com/

Thanks,
Joonhoe Kim

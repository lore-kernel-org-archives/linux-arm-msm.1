Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457528;
	b=f3gtk/v/hiOdDygZrg5izABe71eayTXwej8kz4Cu2xdbb9aJXc7bqKqR4pliZgLV3hkG
	 dO1ubErQebSKIZ4G8cd7+hxb8BddS88ce1VRyMqsEk4cxwHXx7iR0gI9fqJdMPd+77GSM
	 MpaUgFb8w593YnTLPmAuQ9Pro/nNvetjr3lQDAgPCQ3dwFHgVKsqoTILdK2DsxVXaTMZG
	 hsSN61QdpfY3eX3kcAR5my44SEKLeoyg/4azuQeJoapBHNakypIAXFpTKxSnCLkeMLd1M
	 xu5vUXt/ll6DVPmVy8xAZ6eYIHGU5DLaQDE7Uf8qsXrdTLciEzpgE9EYLtjcN7KPDpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jzqkJeZaTQXahw6ShZXqUnXj4qKS+ePavQpcZ/GtLFg=;
	b=fy7Wxn5PWwym9d97JpScOZxFRIx2Af/Taz+BvNvL9QJzFX2yTB7nAOha4pxQMYvKgwcj
	 vgfsVKQr0sInubCmRCxXlHWwyAHGcou15TnFummFNJXUCE8jFUXu9uKxmopD/q2JKr/ly
	 d/q1WkQrMjZFhV1aYOg3TQH/FcwtMQqDEYBZnHHUn7lcQWw1///QdNFkruCZ8DhxEhtpP
	 LPZ+iJOSqVwCZ8q56USGQuI6BbfGomF4jVhdzxPXMNuzwo6TlPg2P4gY9/exEQpWP2NHc
	 K2S5Zy53mihHrNhGdSQNECbeomQ8s7IDelRq0mUhPrN8y/Nt1+8TqwQZwNdz4ipXGRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u0ywaFlF;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF65606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF65606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u0ywaFlF
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38644aedba1so5437054eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457527; x=1796062327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jzqkJeZaTQXahw6ShZXqUnXj4qKS+ePavQpcZ/GtLFg=;
        b=u0ywaFlFQGJU+pxzbL1a6SWXyRaCwXZzS5AbxqdZ8bjRjQdOVXELGmrG31NpNdT2DV
         YxIToPBydNJ6+VBAerf2ZQUbvV5aP4E1CppnauztHG5J/REu3mfghDTsDFAeeX2N/lxU
         6yz7wwa07D3H8c3doovT6i2/HLy3Oz/z1mcZZlsvcTBKhBoTDqPcur34aPP/1/esBkW2
         btuFQ/UveeLAZ4E1UKJBZX6KwNHn8mrS09w24sgdNnEaNnWW2Jhnshx90JwneM7NC1hX
         wYm3GYbrav8YUhEKwS1jgi5WMlTAjb7yzCUJgCBQAnyewMP7QGHkdSuWb1Iz+cD3sHrx
         sTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457527; x=1796062327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzqkJeZaTQXahw6ShZXqUnXj4qKS+ePavQpcZ/GtLFg=;
        b=KQTtUPHl+uWLYFud9PFs9vA+L09kdA6r0j+JmVwugoY3t42qU4pkCAg6lCMkO/goRn
         zG1SWSXc6xzgOGui6Z2NfldAoZuVjLTo3siHaOwohi0exS7xsauwG5kouF2L6gbezlFO
         Yk6XwDa7vwtWpcnPZpJfPsbmju7wOwgjTIvvxisBX9c3C2P/QNwlOcUGQ1K6BYMO2azD
         382c5Pg2eINmxcTdfzalHauflze7wq4bUNhxDJC6q9ZZO1+0lvXnpnFo8l08KN+Q8je3
         tf4LvGIUBMP+oFMudpCr4/Ns+lmSTunr9HhUnhAerYwaTHyF2JCUNq8gdrozBhqiztPu
         XAbw==
X-Forwarded-Encrypted: i=1; AL+hErGgl9y1vdIgeVM1hFns6uWF3mu765PECaiO+QEzyKUsGgtcq+wRIrkufGk7LdNg/i1K83KrsAWPFhSoclDh@vger.kernel.org
X-Gm-Message-State: APuU4Z9vhpibxN2dd+x45dstZHoBruVuNR9ijqNrRTviPE1mntzMqMwO
	3TnN601tS7HgLlmgA49ND2Gy5rJ/stCSptq9IBTwdTX+R5s419mIXA2I
X-Gm-Gg: AZFdTZdTmse87A8WTU1fuimoqIHuj6i14KK2uNkWf0q6xwyqK8uY6HtSPwwULcZOHpa
	arHq7GImMUvNJ1WaL40viWQSTnd168CB397nol2SHo+kWbAOAHajIoW1IgqOqH/j5AfWt5uJjfa
	JSAvaZfDvHmcry6X8FG0sBHDQ1xYhTtC6SM7jBPw2ptUT7a4w6QTX5CS+GKefiAqHE2mHoVrOHl
	P4HcRSNOLsFJuz3K+8Qxquz53VBhU0VWh01vaDy5vgElcLOO61naMevNCWqYqsTNT9k+Y69xmoP
	6uJaHZVWWglyLYv5vgRRSULKAX6rcIdZR1z7nMag4pAsIet5LNrrZB1e6sRVrOI7tJ/Z4ndOsdr
	i/Rvl/679yyfMMe5wLtvTV/T6wEG2qfJajxveL5yDmvbVRosk7bTjqEG9xlSmLzhBxpPFqKzHg0
	Wd155Vam5HBS/SjJNP/7hPZHlPkqt2Jj1hInacmqTcUyPNHhmcudLtEHkzpocBeVq3+jY//q9H4
	kIzCfLdq/KS6Mp1TlnvUn+8Wj8NY+7A984BGltsedTe5Qj/uWctWp9441EVlRComLo18whcgETN
	jXGixxWnY1Jp7JIl1xU6BCU4zt2rMJsuyQLVEOp1tyZwJknOeOG0Wksj95ptJipyyIRYvRuZKxZ
	CgkMFJVoN+Fcvct7q
X-Received: by 2002:a05:693c:83cf:10b0:386:b526:24d1 with SMTP id 5a478bee46e88-386b52638e1mr2787839eec.9.1795457527409;
        Mon, 23 Nov 2026 10:12:07 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm43434987eec.26.2026.11.23.10.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:12:06 -0800 (PST)
Date: Mon, 23 Nov 2026 10:12:03 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Auer <mick@yoxcu.de>
Cc: linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: pm8941-pwrkey - report wakeup events
Message-ID: <awSB8AQVrGEAjFgr@google.com>
References: <20261123130336.1316006-1-mick@yoxcu.de>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123130336.1316006-1-mick@yoxcu.de>

On Mon, Nov 23, 2026 at 02:03:36PM +0100, Michael Auer wrote:
> The power key (and resin, with "wakeup-source") is a wakeup source, but
> the driver never reports a wakeup event. Its wakeup_count in
> /sys/class/wakeup stays 0 even after it woke the system, so user space
> cannot tell a key press from other wakeups. PowerDevil, for example,
> uses the wakeup counts to decide whether to turn the display on after
> resume.
> 
> Report a wakeup event from the interrupt handler, as other power key
> drivers do.
> 
> Signed-off-by: Michael Auer <mick@yoxcu.de>

Applied, thank you.

-- 
Dmitry

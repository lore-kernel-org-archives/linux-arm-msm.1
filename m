Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002406;
	b=rVNbYXUYV/ixC3cjiYBOy2oZl75i7hMErlkALV43WKRShWowHbMKjSfFVmQ+XAdlUQlA
	 GwtN1e9luvKC0A+LyEn4Q8+iAlsi4btnsop3LZ9jeyWoc3U6NOq83G3GlPP/fxBh5Cu/l
	 mW7g/k6rJ3+9gXUmOUiFc05/DZf/2BNMgnGbgjErW/CpiWhUD2jXuPwJtTLYyQR+S899+
	 OuUrNT0x1tPx0RoGwCyOz9UV09sCn2ZQJ0TDyrBe9qLh30w2zok33vJx5Vx4gXjQ1dajB
	 zxQlY8A9/qpoqK0FwgtIq4b9vgjNVWv8u3xhUrUOtbrdqd5aHBFe5pRjLePJFqbHb/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c8wD/NgRN1vKnswesHA4v4xfkwqTNGymHPvs1+drLPQ=;
	b=WFY9ZblUrQECPy3TZuY8KG3q2NnmsIXk9c2G13m+96rANAGbjM7j0loCiAXSIyny9fuI
	 u2tPgIPGCvYBSEQt7xpQ1AZq28S/2YvxStb7jammNCKWChtoXoCRfDOdfd4yBxRdCFWjy
	 7T5jNcBmAM8IBieYVBexSLo5ms+lJ3vW5VCP2+Nmv4sAjW3vZMkXQ1Cv1iKwQW7FbiLAv
	 bKGaeBQuWS8Jd9FsL9dwRKo5qXWMNQk8+xs3amSDBqfFxwUQr6jdEUYafpF6/1L6UYKh5
	 LBScdfwtOK80kk7eJsCWyJA9N3f2/0AuxEZdtPcIy7ZB2uLq+2+NQLIaaDqxFw2c8eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c8yC2OSE;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F7606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76F7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c8yC2OSE
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so310092e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793002404; x=1793607204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8wD/NgRN1vKnswesHA4v4xfkwqTNGymHPvs1+drLPQ=;
        b=c8yC2OSEPjjy8V7oBRN61y2M/0GWFZHgDZoSlFSAtUPwNLmT79evOgmDCrPmurAqXV
         n4tJGvjFemnFdh7uC9CFdsMYD+pcfenx9HYz6rr2jhzDZaYjQog9t+8jaC/k78WeiwiH
         0S+hBiPAFoFVIXpRtsP2QyGpZSZe+BJ5g+xNPi6eodToio5qwQLGzZ+2VaqEk23FP8k4
         rFOz6LNRZY3TZgqGYJV5e8bZcbT+uTvY9zmvDKR2nXb2f9PIj3yL4YDHo9QO0+iAchP9
         CL71UQM8PklWePpe68gynaTxp3K+dbJCVtVSCTjSr0tI0gJY9pb9DhEQL98lfq9bUfFN
         xjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793002404; x=1793607204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8wD/NgRN1vKnswesHA4v4xfkwqTNGymHPvs1+drLPQ=;
        b=O/Jkb+Wk8fbWs2P3sA4hDDNmK0Eet2a059GSYNO9tsdJ0DQfgAjMaxpdZl1Yd+WWKA
         Sw+AOkThB31Mq1yHPpJVOs+gWRfKHdT+LYHATTWhP2xhAD9UriF9o6HabDdUY1T3+whh
         JwL+T19ypzt1xyGmXLTuQ67CGbYPDbaL2w1ZwQ5aYpxHyXbWmgtnbyB6HELKl4VznTaj
         ozycEpyweoqOkWkdnhT26dCa+xk/MItLJa8CzSuvF9+TzylL7LjXAnfxN2ZWEnLrT7TI
         wjZI8b9/GX0KeoPetBEaICL4GdK19F6cUIFJWeufp7+9vo1NMctgO8z1ZrwRxjghWAv0
         lVvA==
X-Forwarded-Encrypted: i=1; AKwUvBwYG598BL2vWkJ36tzCBn6SuEhfjkKcK+pPQqf4yG/ekwugwXL2bzn8u4xUrkK89gdj95MretqzSPMNDH8F@vger.kernel.org
X-Gm-Message-State: AFq9FYJdKx7NhYtHF2mA/+hT86J05xkWQKWz9ZcBzkolq9NVSUt9Sclg
	DFP3DQnYUnU4x5pvDR8e6Ca2x5QCb8hwGudowwI/8XqZ/GVSghVY0eV6oGoxrhKi
X-Gm-Gg: AYBFou3yICxVtj6K77wu5t8nocbB9msWwfp9Hx1q7AeFX4P36i3B9OZoz9HcRGoGspb
	jKylnxcVx+D5LDmICEYkiiVMUiUN5SomYOwTBqz3AA36PiSqu0Zm0lXgneNq9DXZCYIE7MjVUko
	O1dPDaGL75XiPxcPiEkkB7pTqQ63PsLes0SEhaQMNRgxfcK+gDVXb5+OCmpmyn3mGhJPmH2rCCb
	Q9JQm3OpLvSO8EnLl7H8fkXOI4Z3n4NSjitJDY0LBYT5GmSfSdK8Azpqc/VLvX2BArtUopWV+Sk
	slq7g7nQsN+jEH3BSOQNze/Uv0lVaA4ngAiGaugBhLJ5nG78rPDnQbVRbeiqGeguY+LRHp7P7gE
	Q45XQ9tLkrfrf+vjgFNg3Zony2wSSw1zvTgu2ko44WiJD1r69O27CEH+aPWnMLpw1+u+gOZN+T9
	135MNo/ggCp2sbKDOAMg0RV4tFmpqmQpp7WxdgGYjtq5UGk7SXvZYYvzPShTsipIX7tG9Rn6CYZ
	ZdBxvnSOsWIHLi3GGNB8ml7iPY5poQcIZMmYOOctIAbqphVmnGGGJdU04wlXj5YUgFESRx+zypi
	D93binDfPATWSbjOgbaXfSJTk+gtZA/gKhsIj0CPEZqlEK/A8N59Y3IJDmPNQA==
X-Received: by 2002:a05:6512:3f08:b0:5bf:a42d:9115 with SMTP id 2adb3069b0e04-5bfb7171b91mr2214747e87.4.1793002403616;
        Mon, 26 Oct 2026 01:13:23 -0700 (PDT)
Received: from yantra.. (nekmmqusumz5xuyc5yb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b52c:35a:762:9323])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb952a61fsm1177483e87.75.2026.10.26.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:13:23 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic@kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Marco Elver <elver@google.com>,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Mon, 26 Oct 2026 10:13:18 +0200
Message-ID: <20261026081318.318870-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025215954.73549810@jic23-hlaptop>
References: <20261025191510.22261-1-zoone.rupert@gmail.com> <76bbebb4-7337-486d-8f21-a39bcb6dca93@acm.org> <20261025215954.73549810@jic23-hlaptop>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 25, 2026 at 09:59:54PM +0000, Jonathan Cameron wrote:
> Rupesh, if you think that is coming soon then please just make
> next version of this the first patch in that series.

It is close. The other fixes are done and build clean, and most of them
match Bart's branch. I'll send them as one series with this as the first
patch.

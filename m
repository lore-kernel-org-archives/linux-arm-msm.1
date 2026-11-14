Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678349;
	b=2w0IUCqkXX/qwyCYMFZaP9mE7DVPbqVw9w3wvgo4fgpVtRvnDqx4KmBn162Mz4vJDqXF
	 +TjpVUjwqK9SDdfxosZ8Iq+qEBYVO2aOiNv5mReUbmJwX5Ch3o4bhkxB1Sdf4Iy/HwD3R
	 A4/1cMcv5q5nUaMQqjIUQY6sEt+YOGFnw3uNGbL914IWkqRbXbGnoVA9szF2Iz56taCZ9
	 wgeJMizUcdfUywVEAshUoERB8ZuhgGfJkGPg7dLhMzCfv6SrzEILMfp+/lArD4Y3jLRrm
	 V53s2AmQ70nnULEX9ipgWhpTlRoasmjJ3ZCN0BTxg6j2/7mqpyUiHhC/TToKzSDLERw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cEiz3TWwHF+fIuW7i8DsJuBkmIDZsePDbm8l7cMfQMo=;
	b=d+UqaZS/tzQxQLguWjH1qKwAlLn2D5Wx1Rgue82oFICZAJvgP41wJTRzgZKJ4Ad9rXs1
	 vcUkqgt0KI9WfVxr4nGDj7vr95+uA5seWrN9I4bmUMylqN/RJ3AOiO1TfxoLTl0zhcphE
	 fQzfmlzT+WM5oYVi4CtzdtyGG6oI2TvETvYNvAbMGSCR0WvzuzEE3OrFmJL8pH7+Fwu/9
	 4LOoQ4UN+WJ/1moKpIHjj6Db1oFJfTHyYjZopZNQXjdAHl2tR3OG/36rnoqxkCZZxNn8b
	 VO7EwbYN3fIJ/e2ALAol0nBim29Xhxnh43inoAg5MOSRqrFV7RC/2TbyxkTRo72vthw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C68B606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C68B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50604721c8so395506866b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794678347; x=1795283147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEiz3TWwHF+fIuW7i8DsJuBkmIDZsePDbm8l7cMfQMo=;
        b=uMXE4lJfTArG0gCj3Di5yz0u2DCklqsdtTPCADzHhx3fg/rnHItX11qsTMgMT1bH9L
         fIRgaXEr9kJ8Uw6TINxpdMFjWUyc0RuxWCjVW96eU66ZK7Mx68BpTfG+lTl/Z+5N3Mtb
         9FOE2ZoWR7yxaJSiOp/ZAV87HOPIpqx5Cw9eBfHYzmDrOBhdgRCb1FoZe6Pg6UNznTLm
         utnO/fY9CSPFwE1gqmgsMj/O2LIrumJ9EWZ1ip9xWxXtYr1bEmGXA0c1hZ4p9kbqsGt7
         Ajq6FDxj16/soWPIdEnuXzq6f7P3RAqxas7E46F0Agrcs4xukyxhj0Ui00FEEo0e8nX8
         /Gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678347; x=1795283147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEiz3TWwHF+fIuW7i8DsJuBkmIDZsePDbm8l7cMfQMo=;
        b=G/4EpfpGBat0dE61g32Kv2FZf5Ply1SNvpiIa0I8Oko93O7jfUGxUoqnU8/oyymsgG
         cLspuiy/EiXI9V0d/9RP2nzVGx61f46H/iGWy0nTVSUBcJeZMsXmd/mRK3O6phjdN8Iv
         8FIkVMMSaZpZa0bOzzSKL9LClk6TF/b7gLgwUEwkMO1SBpXTZQ9LPTIm8L6f6FgNEQZX
         08n+v1I2hxU4yQe/EqMnVSlP8+tdbVZDW1VMtY2ofwNOJDa6atA3TcjevEbyfTzu7glH
         ESGxtNgqXN+9Ltk82+YgLTdV/cBLPNlr9J8dcLKrOlN25L4YhIFfVReORxlHAgT2WQTL
         cD6Q==
X-Forwarded-Encrypted: i=1; AL+hErHEyle0Zvssa0UhuXYza4E3IQ+hEYy54tMGj4JwrnU5F2yr/Ej/muzLIxX/7AGyX1GTN8EC3nvvGzvEzUDv@vger.kernel.org
X-Gm-Message-State: APuU4Z/NOAIRa4A8ZbuBBw33AFMP3yrdvEJP+TR3kOB92hA1y/8LQ8/o
	gBDWGFYVrArC356VJfNrV1X0WGnRS84UmXcCbykuEvTyrkAxrmdnsmLCssyvYFAYsg==
X-Gm-Gg: AYBFou1z6CHzgWXe+Vp+EPDzICVXvaTkw0XdONqZlV+qCYjurL4ZEd2kq3GCuwYbOB8
	mKRIJbBg5aGSei0fcjbVTUVd2g/yE6Q7oEIVlzZ44llAVF0C//+eJ88AEaaG14RIwq5ohVZPOtK
	YQsgEiQ1RDaOi/uI1ThcZWw90g3QmKfsvXc3FAGZ/FdmlIzOYopohjr9u7/V+xrq3QIzhfzaovr
	yof4M5tD4E7eh5Mh10to63/q+l9Auwi7omrAFek9LJVWz2rCrSa8Sic299QFlTmjSy1bKO8GVhO
	FyQp+ETZRDGs2+Dj1AKFCoMTLaTH8tB9mszUOZbnhfHMe2h4eTNN1NCnDHeX1Uv+Tb8/a6K2p+t
	WqTmtxBQnDxnSdkn5GHgjby0PKkv3S1/5xaEyXaRIyrf4Z+yW5avoK+YWH/ZmXX1cy9m026ky7K
	IXACfs8Wym4J2Swlx+w+YsJa4B0PLUc3MBEiQEiFFXsxkZwE+cqG7rJNww+oirHzKOaaWSiXwnD
	saku1g9BkoNFKB7m4LsFPJEQL2WTV17UoNHSTZL0shgTK7EpZFO44Pqkcf8PUqkP+nb9hwbrBaO
	W8poUQqgXZL5cuhaIimCsrOfc6NHn25qPjPqPHYa3BKMCDUxreevptYwSFMBeX7K206Sln7EKAb
	AZxcNoGz4Qli7dWDMSxbasClr8k/MpcesavQitXaVuCadSXBWCXHvpr68Xutw1DOwmv3r22ep51
	PWGrCPSz4jzJAn93IxxWhnIn1aQTVdh84qnhcXfCDKm5E+kkA9a/yEU+YAI+7yakSJ2dBsyH+on
	eC8vM/9tmG2vSEtUl6lFCj+WH0ZJCzj+mGDI1ks7+cRM9yrjgsRKoRx1y5LsCeb1Ijypl+JBgfa
	nm4=
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr488914366b.16.1794678347384;
        Sat, 14 Nov 2026 09:45:47 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm2474985a12.6.2026.11.14.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:45:46 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Keep objects of queued VM_BIND unmaps busy
Date: Sat, 14 Nov 2026 18:45:44 +0100
Message-ID: <20261114174544.769803-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CACSVV01-U9jEOfKsO8fgGtG_xQqjOF4TAKycJnqp4E-eDqsC2g@mail.gmail.com>
References: <20261111080619.244138-1-julius@bairaktaris.de> <CACSVV01-U9jEOfKsO8fgGtG_xQqjOF4TAKycJnqp4E-eDqsC2g@mail.gmail.com>
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

On Fri, Nov 13, 2026 at 12:57:27PM -0800, Rob Clark wrote:
> Nice catch.. I don't really love that it means we can evict mapped
> buffers but not ones pending unmap.  But so far I don't really see any
> better option.

Agreed, I didn't find a better one either.

> (Small note, a dma_fence should fire in a finite amount of time, or
> TDR should kick in on the signaling side.  That ofc doesn't change the
> issue here.)

Right, thanks.

Julius

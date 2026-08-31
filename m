Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580F43B531A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147526; cv=none; b=XCLk+//q5PA6NSVisoZ3It1hHwI8m/8dEh1jxn8rPeMD2ejKqzJvGIVgxKhPqfi9fgVsPpjUW+DrflGO1KCD/rorZc8mldP/NkSRIX1ad0kp5cx9mVmkDBR1azSRXWRbnsof/mU0UQUa7UADQmj+7gpb53Gzn8I3uzfc2SYViu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147526; c=relaxed/simple;
	bh=JfQhqAVrAGb7QD/nEHGgxs1D9L6nrbUSTxK+DVMj8gg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gcLuzcWNbvwnPSEQGL53ULG1Kr5/uL17tlinmY3tt3tIeAHaraY1Cg/NO8YVA2+PHfxWu2E+HIUR3PAg2oA9uvoRPBhIhp0X2PPsx0kLhBQgMnEmT5n/ZOuiluUe6VNxlsX4TyLjFhiPmcXBo62wn/F5E1v9YvkbaC4o+8eS26c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhZzGaAX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhZzGaAX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso22284675e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 20:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788147511; x=1788752311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/yh0X2KBuU9yYGZNDeELtkOjFUlaqlWTJeOHvjigybg=;
        b=DhZzGaAXDCMaoQ1TiL8dyFDkveH/vyGzu8yg54mwUzIV04kyxk/ivU8/8Hx99lSb/C
         gO+FiTzdi0poO+oqv4hc2qctdhTrN19jp3jGeLFhcFeTuthQvxnbj8dW6LI+Jr/SKRIf
         sGBCp7qCJxpms+FsflXxMDFgRL/sKkPP+2PgsixHLHxdKrBP64jhD05zmngbnhjJWWDe
         smhWAvjfwvxC5dvt9akz4gkTtpqXcvohhUr5a6iDMGhuA6pjz73h/DjY2lLlGcotw625
         PecRy+ryQvydG6LWZ4vRxlpCddMIXhRNH/hdVdUA6zzIojz27YN/VCx5Ep1odh2kHWiB
         Vv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788147511; x=1788752311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yh0X2KBuU9yYGZNDeELtkOjFUlaqlWTJeOHvjigybg=;
        b=sfz/0NNieqlvXpYSbUaUg2Kyh7+FzoHrY+iWNgV5GFAe5uWmCg6ZdSg5Rxjnxf0bZ+
         cBIkRBcntrkb1AkdZPXv73DCQfE0UeAtygZS9oFWKXCXbqjEuVaJzJEFKhSoUI9wT4Fn
         sc6MzQ2ZrS56OZ2UyMUtlskEglrxToLkfGOR0xdKGPNyifSgueLO0CKsUH+CDd5DM/ky
         9Lz/QvWOJj3B+2yDH69yaVNUDHGoKbIwNQny6TQcSsD/JlEsF5FyX9JBRFoHUWNE4CTS
         XPoo5dqH0LV8WkI6njRDvZ+Kn/sjfa2zBQpnxoiVPe77HDW+6fnKR9KVyrGBhxCx5Bi3
         GGLw==
X-Forwarded-Encrypted: i=1; AHgh+RoFTQMz7+khswt2B7/B5A8NrY6XGN7apnr9MtuUBnnaKciN4gweD+8CaaJSaFPtrGF1NKFyS6qHiCEUBCct@vger.kernel.org
X-Gm-Message-State: AFuF++lofG7cBLwOkNm243EklQ3DMeZaDFqoB1T57qJGTqW5aom7uzhk
	OaGCaAjzXOVkb9kSnFT2ZTQ/bcQC02dxN8nhZuR/zBOkYjeW9in+iblC
X-Gm-Gg: AR+sD12uEPUFqWkA5/fdIp0sQtyXXWNJkJVmzHDph8JAI2+owGq6frlV1B/Y6y9v3dU
	+0maU5o3bMcDPWch4jCSANo1NvI8PcOvgwVgptdsDd2QJy6mbMz+3fa88c0F50SKfWWwT8Tjan9
	t7W/eKD5cqEMMIv7qp5TfJpIBszqsry/pQKsUbQ0QUvJh8bucqLzWe2R+W4RvNmnGNGIwkDDSUT
	q7JJ9ybxLZs5pxzfMD4pUHu82DBT9Oe1TivAscivLyvnc3jxXWKblVtBjv47B/NLvZvGlS+Mgx2
	sZTKlHNVr7gji2aN+iBc8LAjbvhsF/9nHf8YfRQ5A5ZaEyGkjiVhmlhcapggk8zfySVTQyPbMkT
	Vi/ArOzHyAWPthgZvaoWwk3dgkQcxKRgwscblI4gp4rHvrVmggtaIXMNBed9yuf4tOU9A3HfNFU
	rPvlCU6mWWbDYpSi+VOxI1EN9a3XMVDb3jA6+acDPg20bvwwQa1OyYDVJ/Wu+R4qKthjA=
X-Received: by 2002:a05:600c:c178:b0:499:872b:abd4 with SMTP id 5b1f17b1804b1-49b91c21b86mr308435895e9.6.1788147511021;
        Sun, 30 Aug 2026 20:38:31 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab5a2csm17624175f8f.4.2026.08.30.20.38.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 30 Aug 2026 20:38:30 -0700 (PDT)
Date: Mon, 31 Aug 2026 05:38:25 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Matt Eaton <linux@divinehawk.com>
Cc: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
Message-ID: <20260831053825.11f1007d.michal.pecio@gmail.com>
In-Reply-To: <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
	<20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
	<20260830165934.34e5b82f.michal.pecio@gmail.com>
	<CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 02:58:55 +0200, Matt Eaton wrote:
> I applied these (from 7.3-rc1) to my 6.18 kernel and appears to fix
> the issue:
> 
> commit e3d757dc9257
> commit 042aad8d0db6
> commit 7e0ef4332ed9
> 
> There does not appear to be a need to apply this patchset now. Thanks!

Great. Did you try disconnecting from external hubs? This code can't
detect that, but maybe it's not a problem case. It wasn't on Renesas.

Out of curiosity, was it limited to USB 3 devices or also USB 1/2?
Disconnecting one device or a hub with devices behind it?

Another interesting thing about Renesas was that the command only got
stuck when all root hub ports were disconnected, and it would suddenly
complete if the same or other device was connected back to the same or
any other port before the 5 second timeout expired. This gave us hope
that the problem really is limited to disconnections.

Regards,
Michal
